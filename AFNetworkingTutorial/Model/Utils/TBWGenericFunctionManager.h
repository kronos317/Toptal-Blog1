//
//  TBWGenericFunctionManager.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBWGenericFunctionManager : NSObject

+ (NSString *) refineNSString: (NSString *)sz;
+ (int) refineInt:(id)value DefaultValue: (int) defValue;

#pragma mark -Utils

+ (id) getObjectFromJSONStringRepresentation: (NSString *) sz;

@end
