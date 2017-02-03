//
//  TBWAppManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWAppManager.h"
#import "TBWMountainManager.h"

@implementation TBWAppManager

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
        [self initializeManagers];
    }
    return self;
}

- (void) initializeManagers{
}

- (void) initializeManagersAfterLaunch{
    [[TBWMountainManager sharedInstance] requestMountainListWithCallback:nil];
}

@end
