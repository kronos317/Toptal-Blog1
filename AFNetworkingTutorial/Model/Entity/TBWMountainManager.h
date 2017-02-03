//
//  TBWMountainManager.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWMountainManager : NSObject

@property (strong, nonatomic) NSMutableArray *mountainList;
@property (assign, atomic) BOOL isLoading;

+ (instancetype) sharedInstance;
- (void) initializeManager;

#pragma mark - Request

- (void) requestMountainListWithCallback: (void (^) (int status)) callback;

@end
