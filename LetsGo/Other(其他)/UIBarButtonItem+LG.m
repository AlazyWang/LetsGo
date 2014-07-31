//
//  UIBarButtonItem+LG.m
//  LetsGo
//
//  Created by robert on 14-7-31.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "UIBarButtonItem+LG.h"

@implementation UIBarButtonItem (LG)
//[navItem initWithImage:<#(UIImage *)#> selectedImage: target:<#(id)#> action:<#(SEL)#>];
+ (UIBarButtonItem *)initWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName target:(id)target action:(SEL)action
{
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normal = [UIImage imageWithNamed:imageName];
    [button setImage:normal forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithNamed:selectedImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    
    return  [[self alloc] initWithCustomView:button];
    
    
}


@end
