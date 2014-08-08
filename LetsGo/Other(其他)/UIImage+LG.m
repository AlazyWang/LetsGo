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

+ (UIImage *)resizeWithName:(NSString *)name
{
//    UIImage *image = [UIImage imageWithNamed:name];
//    return [image stretchableImageWithLeftCapWidth:0.5 * image.size.width topCapHeight:0.5 *image.size.height];
    return [self resizeWithName:name width:0.5 hight:0.5];
}


+ (UIImage *)resizeWithName:(NSString *)name width:(CGFloat)width hight:(CGFloat)hight
{
    UIImage *image = [UIImage imageWithNamed:name];
    return [image stretchableImageWithLeftCapWidth:width * image.size.width topCapHeight:hight *image.size.height];
}

@end
