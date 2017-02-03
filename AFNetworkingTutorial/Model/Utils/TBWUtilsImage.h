//
//  TBWUtilsImage.h
//  AFNetworkingTutorial
//
//  Created by Chris Lin on 2/3/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TBWUtilsImage : NSObject

+ (void) setImageView: (UIImageView *) imageView WithUrl: (NSURL *) url Placeholder: (UIImage *) placeholder EnableCache: (BOOL) cache;

@end
