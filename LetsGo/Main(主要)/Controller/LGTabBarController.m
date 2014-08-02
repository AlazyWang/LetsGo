//
//  LGTabBarController.m
//  LetsGo
//
//  Created by robert on 14-7-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGTabBarController.h"
#import "UIImage+LG.h"
#import "LGNavgationController.h"

#import "IWHomeViewController.h"
#import "IWMessageViewController.h"
#import "IWSqaureViewController.h"
#import "IWMeViewController.h"
#import "LGTabBar.h"

@interface LGTabBarController ()<LGtabBarDelegate>
@property (nonatomic,strong)LGTabBar *custonTabBar;
@end

@implementation LGTabBarController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addTabbar];
	// Do any additional setup after loading the view.
    [self addChildAllViewController];

    
}

- (void)addTabbar
{
    LGTabBar *tabBar = [[LGTabBar alloc]initWithFrame:self.tabBar.bounds];
    tabBar.delegate = self;
    _custonTabBar = tabBar;
    [self.tabBar addSubview:tabBar];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    for (UIView * objc in self.tabBar.subviews) {
        if ([objc isKindOfClass:[UIControl class]]) {
            [objc removeFromSuperview];
        }
//         LGLog(@"--%@--%@",[objc class],objc.superclass);
    }
  
}

- (void)tabBar:(LGTabBar *)tabBar didSelectItemFrom:(int)didSelectItemFrom didSelectItemTo:(int)didSelectItemTo
{
    self.selectedIndex = didSelectItemTo;
}

- (void)addChildAllViewController
{
    
    // 1.首页
    IWHomeViewController *home = [[IWHomeViewController alloc] init];
    [self addChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    // 2.消息
    IWMessageViewController *msg = [[IWMessageViewController alloc] init];
    [self addChildViewController:msg title:@"消息"imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];

    
    // 3.广场
    IWSqaureViewController *square = [[IWSqaureViewController alloc] init];
    
    [self addChildViewController:square title:@"广场"imageName:@"tabbar_discover"selectedImageName:@"tabbar_discover_selected"];
    
    // 4.我
    IWMeViewController *me = [[IWMeViewController alloc] init];
    [self addChildViewController:me title:@"我"imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //    v1.title = @"首页";
    childController.tabBarItem.title = title;
    
    childController.tabBarItem.image = [UIImage imageWithNamed:imageName];
    childController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",arc4random_uniform(100)];
    
    if (iOS7) {
        childController.tabBarItem.selectedImage = [[UIImage imageWithNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else{
        childController.tabBarItem.selectedImage = [UIImage imageWithNamed:selectedImageName];
    }
    
    LGNavgationController *nav = [[LGNavgationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
    [_custonTabBar addTabBarButtonWithItem:childController.tabBarItem];
    

    
}



@end
