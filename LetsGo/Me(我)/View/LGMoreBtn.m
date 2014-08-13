//
//  LGMoreBtn.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGMoreBtn.h"

@implementation LGMoreBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark 设置按钮标题的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    UIImage *image =  [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    return CGRectMake(0, titleY, self.bounds.size.width,  titleHeight);
}

#pragma mark 设置按钮图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    UIImage *image = [self imageForState:UIControlStateNormal];
    return CGRectMake(0, 5, contentRect.size.width, image.size.height + 5);
}

@end
