//
//  LGTabBarButton.m
//  LetsGo
//
//  Created by robert on 14-8-1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGTabBarButton.h"

@interface LGTabBarButton ()
@property (nonatomic,strong)UIButton *badgeBtn;

@end

@implementation LGTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
        iOS7? [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] :[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        UIButton *badgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        badgeBtn.hidden = YES;
        badgeBtn.userInteractionEnabled = NO;
        [badgeBtn setBackgroundImage :[UIImage resizeWithName:@"main_badge"] forState:UIControlStateNormal];
        [badgeBtn.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
        [badgeBtn.titleLabel setTextColor:[UIColor blackColor]];
        [self addSubview:badgeBtn];
        _badgeBtn = badgeBtn;
    }
    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;

    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    if ([_item.badgeValue intValue] > 0) {
        _badgeBtn.hidden = NO;
        CGSize size = [_item.badgeValue sizeWithFont:_badgeBtn.titleLabel.font];
        CGFloat btnW = size.width + 10;
        CGFloat btnX = self.frame.size.width -  btnW -5;
  
        
        _badgeBtn.frame = CGRectMake(btnX, 0, btnW, size.height);
        [_badgeBtn setTitle:_item.badgeValue forState:UIControlStateNormal];
    } else
    {
        _badgeBtn.hidden = YES;
    }
}

- (void)setHighlighted:(BOOL)highlighted{}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height;
    CGFloat titleHeight = self.frame.size.height - titleY;
    return CGRectMake(0, titleY, self.frame.size.width, titleHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    return  CGRectMake(0, 0, self.frame.size.width, image.size.height);
}



@end
