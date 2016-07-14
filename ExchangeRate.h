//
//  ExchangeRate.h
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
@interface ExchangeRate : NSObject <NSCoding>

@property (strong, nonatomic) Currency* home;
@property (strong, nonatomic) Currency* foreign;
@property (strong, nonatomic) NSNumber* rate;
@property (strong, nonatomic) NSDate* expiresOn;
@property (strong) NSMutableDictionary *completionHandlerDictionary;
@property (strong) NSURLSessionConfiguration *ephemeralConfigObject;

-(bool) updateRate;
-(NSString*) exchangeToHome: (NSNumber*)value;
-(NSString*) exchangeToForeign: (NSNumber*) value;
-(void) reverse;
-(NSString*) name;
-(NSString*) description;

-(ExchangeRate*) initWithHome:(NSString*) aHome
                      Aforeign: (NSString*) aForeign;



@end