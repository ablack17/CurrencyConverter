//
//  URLFetcherExample.m
//  Currency Converter
//
//  Created by Aislin Philomena Black on 7/13/16.
//  Copyright © 2016 Aislin Philomena Black. All rights reserved.
//

#import "URLFetcherExample.h"


@implementation URLFetcherExample
/*
@synthesize completionHandlerDictionary;
@synthesize ephemeralConfigObject;

-(URLFetcherExample*) init
{
    self = [super init];
    if(self){
        completionHandlerDictionary = [NSMutableDictionary dictionaryWithCapacity:0];
        ephemeralConfigObject = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    }
    return self;
}

-(void) fetch
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSURLSession *delegateFreeSession = [NSURLSession sessionWithConfiguration: self.ephemeralConfigObject delegate: nil delegateQueue: mainQueue];
    for(ExchangeRate* i in [ExchangeRate allExchangeRates]){
        NSLog(@"dispatching %@", [i description]);
        NSURLSessionTask* task = [delegateFreeSession dataTaskWithURL: [i exchangeRateURL]
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        NSLog(@"Got response %@ with error %@.\n", response, error);
                                                        id obj = [NSJSONSerialization JSONObjectWithData: data
                                                                                                 options: 0
                                                                                                   error: nil];
                                                        if( [obj isKindOfClass: [NSDictionary class]] ){
                                                            NSDictionary *dict = (NSDictionary*)obj;
                                                            NSLog(@"%@", [dict description]);
                                                        }else{
                                                            NSLog(@"Not a dictionary.");
                                                            exit(1);
                                                        }
                                                        /*NSLog(@"DATA:\n%@\nEND DATA\n",
                                                         [[NSString alloc] initWithData: data
                                                         encoding: NSUTF8StringEncoding]);*//*
                                                    }];
        [task resume];
    }
}
*/
@end
/*
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SInt32 res = 0;
        URLFetcherExample* f = [[URLFetcherExample alloc] init];
        [f fetch];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    return 0;
}

*/