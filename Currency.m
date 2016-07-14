//
//  Currency.m
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import "Currency.h"

@implementation Currency
@synthesize name;
@synthesize alphaCode;
@synthesize symbol;
@synthesize formatter;

- (void)encodeWithCoder:(NSCoder *)coder
{
    //[super encodeWithCoder:coder];
  
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
   // self = [super initWithCoder:coder];
    //if (self) {
       //statements
   // }
    return self;
}
-(Currency*) initWithName:(NSString *)aName AlphaCode:(NSString *)aAlphaCode symbol:(NSString *)aSymbol decimalPlaces:(NSNumber *)places
{
    self = [super init];
    if(self){
        self.alphaCode = aAlphaCode;
        self.name = aName;
        self.symbol = aSymbol;
        
    }
    return self;
}
-(NSString*) format:(NSNumber *)quantity
{
    return @"hiya i don't know how to do this quite yet. Im working on it";
}
-(NSString*) description
{
    NSString* value = [NSString stringWithFormat:@"%@(%@)- %@", name, alphaCode, symbol];
    return value;
}
@end
