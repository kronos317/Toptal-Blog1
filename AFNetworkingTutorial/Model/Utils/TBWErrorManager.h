//
//  TBWErrorManager.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWErrorManager : NSObject

@property (atomic) int nCode;
@property (strong, nonatomic) NSString *szDescription;

+ (instancetype) sharedInstance;
- (void) initializeManager;
- (void) logLastError;

#pragma mark -Utils

- (int) analyzeErrorResponseWithURLResponse: (NSHTTPURLResponse *) httpResponse Error: (NSError *) error ResponseObject: (NSDictionary *) dict;
+ (id) getResponseObjectFromAFError: (NSError *) error;

@end
