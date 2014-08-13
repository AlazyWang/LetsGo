//
//  LGTabBar.m
//  LetsGo
//
//  Created by robert on 14-8-1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGTabBar.h"
#import "LGTabBarButton.h"

@interface LGTabBar ()
@property(nonatomic,assign)int tabBarButtonCount;
@property (nonatomic,strong)UIButton *selectBtn;
@end

@implementation LGTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addPlusBtn];
    }
    return self;
}

- (void)addPlusBtn
{
    CGFloat btnX = 0.0;
    UIButton *button  =[UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat btnW = self.frame.size.width / 5;
    btnX  = 2 *btnW;

  
    [button setImage:[UIImage imageWithNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    
    CGFloat btnH = self.frame.size.height;
    button.tag = 10;
    button.frame = CGRectMake(btnX, 0, btnW, btnH);
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    
    [self addSubview:button];

}

//- (void)btnPlus:(UIButton *)button
//{
//    
//}

- (void)addTabBarButtonWithItem:(UITabBarItem*)item
{
    if (_tabBarButtonCount >=4) {
        return;
    }
    
    CGFloat btnX = 0.0;
    LGTabBarButton *button  =[[LGTabBarButton alloc]init];
    CGFloat btnW = self.frame.size.width / 5;
    btnX  = _tabBarButtonCount *btnW;
    if (_tabBarButtonCount>=2)
    {
      btnX  = (_tabBarButtonCount +1) *btnW;
    }
    
    CGFloat btnH = self.frame.size.height;
    
    button.frame = CGRectMake(btnX, 0, btnW, btnH);
    button.item = item;
    button.tag = _tabBarButtonCount;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    _tabBarButtonCount++;
}



- (void)btnClick:(UIButton *)button
{
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectItemFrom:didSelectItemTo:)]) {
        [_delegate tabBar:self didSelectItemFrom:_selectBtn.tag didSelectItemTo:button.tag];
    }
    
    _selectBtn.selected = NO;
    button.selected = YES;
    _selectBtn = button;
}


@end
