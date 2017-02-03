//
//  TBWMountainDataModel.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWMountainDataModel.h"
#import "TBWGenericFunctionManager.h"

@implementation TBWMountainDataModel

- (instancetype) init{
    self = [super init];
    if (self){
        [self initialize];
    }
    return self;
}

- (void) initialize{
    self.name = @"";
    self.desc = @"";
    self.image = @"";
}

- (void) setWithDictionary:(NSDictionary *)dict{
    [self initialize];
    
    self.name = [TBWGenericFunctionManager refineNSString:[dict objectForKey:@"name"]];
    self.desc = [TBWGenericFunctionManager refineNSString:[dict objectForKey:@"description"]];
    self.image = [TBWGenericFunctionManager refineNSString:[dict objectForKey:@"image"]];
}

@end
