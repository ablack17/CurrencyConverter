//
//  ExchangeRate.m
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate
@synthesize foreign;
@synthesize home;
@synthesize completionHandlerDictionary;
@synthesize ephemeralConfigObject;


-(ExchangeRate*) initWithHome: (NSString*) aHome Aforeign: (NSString*) aForeign
{
    self = [super init];
    if(self){
        foreign.alphaCode = aForeign;
        home.alphaCode = aHome;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    //[super encodeWithCoder:coder];
    
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return self;
}
-(NSString*) name
{
    NSString* h = self.home.alphaCode;
    NSString* f = self.foreign.alphaCode;
    return [NSString stringWithFormat:@"%@%@", h, f];
}
-(NSString*) exchangeToHome:(NSNumber *)value
{
    NSNumber* val = [NSNumber numberWithFloat: value.floatValue/self.rate.floatValue];
    NSString* final = [NSString stringWithFormat:@"%@", val.stringValue];
    return final;
}
-(NSString*) exchangeToForeign:(NSNumber *)value
{
    NSNumber* val = [NSNumber numberWithFloat: value.floatValue*self.rate.floatValue];
    NSString* final = [NSString stringWithFormat:@"%@", val.stringValue];
    return final;
}

-(NSString*) description
{
    return [NSString stringWithFormat: @"%@ %@", self.home, self.foreign];
}
-(void) reverse
{
    Currency* same = self.foreign;
    self.foreign = self.home;
    self.home = same;
}
-(NSURL*) exchangeRateURL
{
    NSString* urlString = [NSString stringWithFormat: @"https://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.xchange%%20where%%20pair%%20in%%20(%%22%@%@%%22)&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=", self.home.alphaCode, self.foreign.alphaCode];
    return [NSURL URLWithString: urlString];
}

+(NSArray*) allExchangeRates
{
    NSMutableArray* allRates = [[NSMutableArray alloc] init];
    [allRates addObject: [[ExchangeRate alloc] initWithHome: @"USD" Aforeign: @"GBP"]];
    [allRates addObject: [[ExchangeRate alloc] initWithHome: @"USD" Aforeign: @"JPY"]];
    [allRates addObject: [[ExchangeRate alloc] initWithHome: @"USD" Aforeign: @"MXN"]];
    [allRates addObject: [[ExchangeRate alloc] initWithHome: @"USD" Aforeign: @"EUR"]];
    [allRates addObject: [[ExchangeRate alloc] initWithHome: @"USD" Aforeign: @"CAD"]];
    return (NSArray*)allRates;
}
-(bool)updateRate
{
    return NO;
}
@end
