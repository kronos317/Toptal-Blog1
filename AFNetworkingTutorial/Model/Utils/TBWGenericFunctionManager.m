//
//  TBWGenericFunctionManager.m
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWGenericFunctionManager.h"

@implementation TBWGenericFunctionManager

#pragma mark -String Manipulation

+ (NSString *) refineNSString: (NSString *)sz{
    NSString *szResult = @"";
    if ((sz == nil) || ([sz isKindOfClass:[NSNull class]] == YES)) szResult = @"";
    else szResult = [NSString stringWithFormat:@"%@", sz];
    return szResult;
}

+ (int) refineInt:(id)value DefaultValue: (int) defValue{
    if (value == nil || [value isKindOfClass:[NSNull class]] == YES) return defValue;
    int v = defValue;
    @try {
        v = [value intValue];
    }
    @catch (NSException *exception) {
    }
    return v;
}

#pragma mark -Utils

+ (id) getObjectFromJSONStringRepresentation: (NSString *) sz{
    NSError *jsonError;
    NSData *objectData = [sz dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    if (jsonError != nil) return nil;
    return dict;
}
@end
