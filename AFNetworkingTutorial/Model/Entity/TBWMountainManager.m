//
//  TBWMountainManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWMountainManager.h"
#import "TBWMountainDataModel.h"
#import "TBWNetworkManager.h"

#import "TBWUrlManager.h"
#import "TBWGenericFunctionManager.h"
#import "TBWErrorManager.h"
#import "Global.h"

@implementation TBWMountainManager

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
    self.mountainList = [[NSMutableArray alloc] init];
    self.isLoading = NO;
}

#pragma mark - Request

- (void) requestMountainListWithCallback: (void (^) (int status)) callback{
    self.isLoading = YES;
    NSString *url = [TBWUrlManager getEndpointForMountainList];
    
    [[TBWNetworkManager sharedInstance] GET:url parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *list = responseObject;
        if ([list isKindOfClass:[NSArray class]] == YES && [list count] > 0){
            [self.mountainList removeAllObjects];
            for (int i = 0; i < (int) [list count]; i++){
                NSDictionary *dict = [list objectAtIndex:i];
                TBWMountainDataModel *mountain = [[TBWMountainDataModel alloc] init];
                [mountain setWithDictionary:dict];
                [self.mountainList addObject:mountain];
            }
        }
        self.isLoading = NO;
        if (callback) callback(SUCCESS_WITH_NO_ERROR);
        [[NSNotificationCenter defaultCenter] postNotificationName:TBWLOCALNOTIFICATION_MOUNTAIN_LIST_UPDATED object:nil];
    } failure:^(int status, NSDictionary *error) {
        if (callback) callback(status);
        self.isLoading = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:TBWLOCALNOTIFICATION_MOUNTAIN_LIST_FAILED object:nil];
    }];
}

@end
