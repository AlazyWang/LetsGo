//
//  UIImage+LG.m
//  LetsGo
//
//  Created by robert on 14-7-31.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "UIImage+LG.h"

@implementation UIImage (LG)
+ (UIImage *)imageWithNamed:(NSString *)name
{
    if (iOS7) {
        NSString *ios7Name = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:ios7Name];
        if (image ==nil) {
            image = [UIImage imageNamed:name];
        }
        return image;
    } else
    {
        return [UIImage imageNamed:name];
    }
}
@end
