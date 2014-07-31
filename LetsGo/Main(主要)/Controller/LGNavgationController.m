//
//  LGNavgationController.m
//  LetsGo
//
//  Created by robert on 14-7-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGNavgationController.h"


@interface LGNavgationController ()

@end

@implementation LGNavgationController


+ (void)initialize
{
    [super initialize];
    UINavigationBar *controller = [UINavigationBar appearance];
    if (!iOS7) {
        [controller setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:[UIColor blackColor] forKey:UITextAttributeTextColor];
    [dict setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)]  forKey:UITextAttributeTextShadowOffset];
    [dict setObject:iOS7?[UIFont systemFontOfSize:20.f] : [UIFont boldSystemFontOfSize:20.f] forKey:UITextAttributeFont];
    [controller setTitleTextAttributes:dict];
    
    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
    
    if (!iOS7) {
        [navItem setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navItem setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [navItem setBackgroundImage:[UIImage imageWithNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    NSMutableDictionary *navDict = [NSMutableDictionary dictionary];
    [navDict setObject:iOS7?[UIColor orangeColor] :[UIColor blackColor] forKey:UITextAttributeTextColor];
    [navDict setObject:[NSValue valueWithUIOffset:UIOffsetMake(0, 0)]  forKey:UITextAttributeTextShadowOffset];
    [navItem setTitleTextAttributes:navDict forState:UIControlStateNormal];
    [navItem setTitleTextAttributes:navDict forState:UIControlStateHighlighted];
//    [navItem initWithImage:<#(UIImage *)#> selectedImage: target:<#(id)#> action:<#(SEL)#>];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}


@end
