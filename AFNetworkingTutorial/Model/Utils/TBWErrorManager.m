//
//  TBWErrorManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWErrorManager.h"
#import "TBWGenericFunctionManager.h"
#import "Global.h"

@implementation TBWErrorManager

+ (instancetype) sharedInstance{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id) init{
    if (self = [super init]){
        [self initialize];
    }
    return self;
}

- (void) initialize{
    self.nCode = -1;
    self.szDescription = @"";
}

- (void) initializeManager{
    [self initialize];
}

- (void) logLastError{
    NSLog(@"Error %d: %@", self.nCode, self.szDescription);
}

#pragma mark -Utils

- (int) analyzeErrorResponseWithURLResponse: (NSHTTPURLResponse *) httpResponse Error: (NSError *) error ResponseObject: (NSDictionary *) dict{
    [self initialize];
    
    self.nCode = ERROR_CONNECTION_FAILED;
    if ([httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
        self.nCode = (int) httpResponse.statusCode;
        self.szDescription = error.localizedDescription;
    }
    else {
        self.szDescription = @"Sorry, we've encountered an unknown error";
    }
    return self.nCode;
}

+ (id) getResponseObjectFromAFError: (NSError *) error{
    
#ifndef AFNetworkingOperationFailingURLResponseDataErrorKey
    
#define AFNetworkingOperationFailingURLResponseDataErrorKey @"com.alamofire.serialization.response.error.data"
    
#endif
    if ([error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey] == nil) return nil;
    NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
    return [TBWGenericFunctionManager getObjectFromJSONStringRepresentation:errResponse];
}

@end
