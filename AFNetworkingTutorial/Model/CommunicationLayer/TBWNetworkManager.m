//
//  TBWNetworkManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWNetworkManager.h"
#import "TBWGenericFunctionManager.h"
#import "TBWErrorManager.h"
#import "Global.h"

#import <AFNetworking.h>

@implementation TBWNetworkManager

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
        [self initializeManager];
    }
    return self;
}

- (void) initializeManager{
}

- (void) GET: (NSString *) szUrl parameters: (id) params success:(void (^)(NSURLSessionDataTask *task, id responseObject))successBlock failure:(void (^)(int status, NSDictionary *error))failureBlock {
    AFHTTPSessionManager *managerAFSession = [AFHTTPSessionManager manager];
    managerAFSession.requestSerializer = [AFJSONRequestSerializer serializer];
    managerAFSession.responseSerializer = [AFJSONResponseSerializer serializer];
    
    TBWLOG(@"Network Request =>\nGET: %@\nParams: %@", szUrl, params);
    [managerAFSession GET:szUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) successBlock(task, responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSDictionary *dictError = [TBWErrorManager getResponseObjectFromAFError:error];
        int status = [[TBWErrorManager sharedInstance] analyzeErrorResponseWithURLResponse:(NSHTTPURLResponse *)task.response Error:error ResponseObject:dictError];
        TBWLOG(@"Request Failed: Error Code = %d, Error Description = %@", status, [TBWErrorManager sharedInstance].szDescription);
        
        if (failureBlock) failureBlock(status, dictError);
    }];
}

@end
