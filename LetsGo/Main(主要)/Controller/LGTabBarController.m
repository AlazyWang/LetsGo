//
//  LGTabBarController.m
//  LetsGo
//
//  Created by robert on 14-7-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGTabBarController.h"

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
////    v1.title = @"首页";
//    v1.tabBarItem.title = @"123";
//
//         v1.tabBarItem.image = [UIImage imageNamed:@"tabbar_music" ];
//  
//    
//    if (iOS7) {
//        v1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_music_selected" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    } else{
//        v1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_music_selected" ];
//    }
//
//    UIViewController *v2 = [[UIViewController alloc]init];
//    v2.view.backgroundColor = [UIColor blueColor];
//    v2.tabBarItem.title = @"消息";
//    v2.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//    v2.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
//    
//    self.viewControllers = @[v1,v2];
//    
//    [self addChildViewController:v1 title:@"123" imageName:@"tabbar_music" selectedImageName:@"tabbar_music_selected"];
    
    [self addChildViewController:v1 title:@"123" imageName:@"tabbar_music" selectedImageName:@"tabbar_music_selected"];
    
    UIViewController *v2 = [[UIViewController alloc]init];
    v2.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:v2 title:@"89" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //    v1.title = @"首页";
    childController.tabBarItem.title = title;
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    if (iOS7) {
        childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else{
        childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    }
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
    
}



@end
