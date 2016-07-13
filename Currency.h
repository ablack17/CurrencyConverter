//
//  Currency.h
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject <NSCoding>

@property (strong, nonatomic)NSString* name;
@property (strong, nonatomic) NSString* alphaCode;
@property (strong, nonatomic) NSString* symbol;
@property (strong, nonatomic) NSNumberFormatter *formatter;

-(Currency*) initWithName: (NSString*) aName
               AlphaCode : (NSString*) aAlphaCode
               symbol : (NSString*) aSymbol
            decimalPlaces: (NSNumber*) places;

-(NSString*) format: (NSNumber*) quantity;
-(NSString*) description;

@end
