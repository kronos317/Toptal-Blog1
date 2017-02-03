//
//  TBWUrlManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWUrlManager.h"
#import "Global.h"

@implementation TBWUrlManager

#pragma mark - Mountain

+ (NSString *) getEndpointForMountainList{
    return [NSString stringWithFormat:@"%@/mountains.json", TBWURL_BASEURL];
}

@end
