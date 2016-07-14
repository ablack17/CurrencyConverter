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
    
    
    for(int i = 0; i < self.moneys.count; i++)
        
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


@end
