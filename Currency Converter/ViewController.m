//
//  ViewController.m
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/12/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //ExchangeRate* er = [[ExchangeRate alloc]init];
    self.er.completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
    self.er.ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    self.moneys = [[NSMutableArray alloc] init];
    [self.moneys addObject: [[Currency alloc] initWithName: @"US Dollars" AlphaCode: @"USD" symbol: @"$" decimalPlaces: [NSNumber numberWithInt:2]]];
    [self.moneys addObject: [[Currency alloc] initWithName: @"EU Euros" AlphaCode: @"EUR" symbol: @"€" decimalPlaces: [NSNumber numberWithInt:2]]];
    [self.moneys addObject: [[Currency alloc] initWithName: @"British Pound" AlphaCode: @"GBP" symbol: @"£" decimalPlaces: [NSNumber numberWithInt:2]]];
    [self.moneys addObject: [[Currency alloc] initWithName: @"Japanese Yen" AlphaCode: @"JPY" symbol: @"¥" decimalPlaces: [NSNumber numberWithInt:0]]];
    
    self.homePicker .dataSource =self;
    self.homePicker.delegate = self;
    
    self.foreignPicker .dataSource = self;
    self.foreignPicker.delegate = self;
}

-(void) getRate
{
    NSString * homeString = [self.homePicker.delegate pickerView:self.homePicker titleForRow:[self.homePicker selectedRowInComponent:0] forComponent:0];
    NSString* foreignString = [self.foreignPicker.delegate pickerView:self.foreignPicker titleForRow:[self.foreignPicker selectedRowInComponent:0] forComponent:0];
    self.er = [[ExchangeRate alloc] initWithHome: homeString Aforeign: foreignString];
    
    NSString* urlString = [NSString stringWithFormat: @"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%@%%22)&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", homeString, foreignString];
    for(int i = 0; i < self.moneys.count; i++)
    {
        
        Currency* yay =self.moneys[i];
        if([homeString isEqualToString:yay.alphaCode] == YES)
        {
            self.er.home = yay;
            
        }
        if([foreignString isEqualToString:yay.alphaCode] == YES)
        {
            
            self.er.foreign = yay;
        }
    }
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: self.er.ephemeralConfigObject delegate: nil delegateQueue: mainQueue];
   
        NSLog(@"dispatching %@", [self.er description]);
    NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [NSURL URLWithString: urlString]
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        NSLog(@"Got response %@ with error %@.\n", response, error);
                                                        id obj = [NSJSONSerialization JSONObjectWithData: data
                                                                                                 options: 0
                                                                                                   error: nil];
                                                        if( [obj isKindOfClass: [NSDictionary class]] ){
                                                            NSDictionary *dict = (NSDictionary*)obj;
                                                            NSLog(@"%@", [dict description]);
                                                            NSDictionary* query = [dict objectForKey:@"query"];
                                                            
                                                             NSLog(@"%@", [dict description]);
                                                            
                                                            NSDictionary* results = [query objectForKey: @"results"];
                                                            NSLog(@"%@", [results description]);
                                                            NSDictionary* rate = [results objectForKey:@"rate"];
                                                            NSString* theExchangeRate = [rate objectForKey: @"Rate"];
                                                             NSLog(@"%@", theExchangeRate);
                                                            //NSString* theExchangeRate = [rate objectForKey: @"Rate"];
                                                            self.er.rate = @(theExchangeRate.floatValue);
                                                            NSLog(@"%@", self.er.rate.stringValue);
                                                            //NSLog([NSString stringWithFormat:@"%@", theExchangeRate]);
                                                        }else{
                                                            NSLog(@"Not a dictionary.");
                                                            exit(1);}}
                                                            
                                                        

                              ];[task resume];
                                                            
                                                    
    
}
                                                        
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.moneys.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Currency* yes = self.moneys[row];
    return yes.alphaCode;
}


- (IBAction)refreshButton:(id)sender {
    NSLog(@"refreshing");
    
    
}

- (IBAction)switch:(id)sender {
    
    NSString * homeString = [self.homePicker.delegate pickerView:self.homePicker titleForRow:[self.homePicker selectedRowInComponent:0] forComponent:0];
    NSString* foreignString = [self.foreignPicker.delegate pickerView:self.foreignPicker titleForRow:[self.foreignPicker selectedRowInComponent:0] forComponent:0];
    
    
    for(int i = 0; i < self.moneys.count; i ++)
    {
        
        Currency* yay =self.moneys[i];
        if([homeString isEqualToString:yay.alphaCode] == YES)
        {
            [self.foreignPicker selectRow:i inComponent:0 animated:YES];
            
        }
        if([foreignString isEqualToString:yay.alphaCode] == YES)
        {
            [self.homePicker selectRow:i inComponent:0 animated:YES];
            
        }
    }
    [self.homePicker reloadAllComponents];
    [self.foreignPicker reloadAllComponents];
}


- (IBAction)calculate:(id)sender {
    
    [self getRate];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    //NSNumber *myNumber = [f numberFromString:@"42"];
    NSString* exchanged = [self.er exchangeToHome: [f numberFromString: self.homeField.text]];
    self.foreignField.text = exchanged;
}
@end
