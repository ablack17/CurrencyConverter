//
//  URLFetcherExample.h
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLFetcherExample : NSObject
-(void) fetch;
@end
@interface URLFetcherExample ()
@property (strong) NSMutableDictionary *completionHandlerDictionary;
@property (strong) NSURLSessionConfiguration *ephemeralConfigObject;
@end