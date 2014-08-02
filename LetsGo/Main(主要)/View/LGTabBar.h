//
//  LGTabBar.h
//  LetsGo
//
//  Created by robert on 14-8-1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGTabBar;
@protocol LGtabBarDelegate <NSObject>

- (void)tabBar:(LGTabBar *)tabBar didSelectItemFrom:(int)didSelectItemFrom didSelectItemTo:(int)didSelectItemTo;

@end

@interface LGTabBar : UIView

@property (nonatomic,weak) id<LGtabBarDelegate> delegate;

- (void)addTabBarButtonWithItem:(UITabBarItem*)item;
@end
