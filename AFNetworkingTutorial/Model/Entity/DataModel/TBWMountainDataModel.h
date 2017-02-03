//
//  TBWMountainDataModel.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWMountainDataModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *image;

- (instancetype) init;
- (void) setWithDictionary: (NSDictionary *) dict;

@end
