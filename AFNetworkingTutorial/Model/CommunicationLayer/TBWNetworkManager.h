//
//  TBWNetworkManager.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWNetworkManager : NSObject

+ (instancetype) sharedInstance;
- (void) initializeManager;

- (void) GET: (NSString *) szUrl parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock;

@end
