//
//  LGNavgationController.m
//  LetsGo
//
//  Created by robert on 14-7-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGNavgationController.h"
#import "UIBarButtonItem+LG.h"



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
    } else
    {
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        [dicM setObject:[UIColor grayColor] forKey:UITextAttributeTextColor];
        
        [navItem setTitleTextAttributes:dicM forState:UIControlStateDisabled];
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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_back" selectedImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImageName:@"navigationbar_more" selectedImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
        
        
    }
    [super pushViewController:viewController animated:YES];
   
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


@end
