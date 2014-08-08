//
//  UIImage+LG.h
//  LetsGo
//
//  Created by robert on 14-7-31.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LG)
+ (UIImage *)imageWithNamed:(NSString *)name;
+ (UIImage *)resizeWithName:(NSString *)name;

+ (UIImage *)resizeWithName:(NSString *)name width:(CGFloat)width hight:(CGFloat)hight;

@end
