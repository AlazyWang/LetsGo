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

@interface LGTabBarController ()

@end

@implementation LGTabBarController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self addChildAllViewController];
}

- (void)addChildAllViewController
{
    
    UIViewController *v1 = [[UIViewController alloc]init];
    v1.view.backgroundColor = [UIColor redColor];
    
    [self addChildViewController:v1 title:@"123" imageName:@"tabbar_music" selectedImageName:@"tabbar_music_selected"];
    
    UIViewController *v2 = [[UIViewController alloc]init];
    v2.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:v2 title:@"89" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //    v1.title = @"首页";
    childController.tabBarItem.title = title;
    
    childController.tabBarItem.image = [UIImage imageWithNamed:imageName];
    
    
    if (iOS7) {
        childController.tabBarItem.selectedImage = [[UIImage imageWithNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else{
        childController.tabBarItem.selectedImage = [UIImage imageWithNamed:selectedImageName];
    }
    
    LGNavgationController *nav = [[LGNavgationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
    
}



@end
