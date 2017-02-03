//
//  TBWUtilsImage.m
//  AFNetworkingTutorial
//
//  Created by Chris Lin on 2/3/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#import "TBWUtilsImage.h"
#import <UIImageView+AFNetworking.h>
#import <AFImageDownloader.h>

@implementation TBWUtilsImage

+ (void) setImageView: (UIImageView *) imageView WithUrl: (NSURL *) url Placeholder: (UIImage *) placeholder EnableCache: (BOOL) cache{
    if (cache == NO) {
        [TBWUtilsImage clearImageCacheForURL:imageView URL:url];
    }
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    
    __weak typeof(imageView) wImageView = imageView;
    
    [imageView setImageWithURLRequest:request
                     placeholderImage:placeholder
                              success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      __strong typeof(wImageView) sImageView = wImageView;
                                      sImageView.image = image;
                                  });
                              }
                              failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                  
                              }
     ];
}

+ (void)clearImageCacheForURL:(UIImageView *) imageView URL: (NSURL *)url {
    AFImageDownloader *downloader = [[imageView class] sharedImageDownloader];
    id <AFImageRequestCache> imageCache = downloader.imageCache;
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //Use the image from the image cache if it exists
    UIImage *cachedImage = [imageCache imageforRequest:urlRequest withAdditionalIdentifier:nil];
    if (cachedImage) {
        [imageCache removeImageforRequest:urlRequest withAdditionalIdentifier:nil];
    }
}

@end
