//
//  UIBarButtonItem+LG.h
//  LetsGo
//
//  Created by robert on 14-7-31.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LG)
+ (UIBarButtonItem *)initWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action;
@end
