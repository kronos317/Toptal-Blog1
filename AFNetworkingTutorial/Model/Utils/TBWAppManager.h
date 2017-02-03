//
//  TBWAppManager.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWAppManager : NSObject

+ (instancetype) sharedInstance;
- (void) initializeManagersAfterLaunch;

@end
