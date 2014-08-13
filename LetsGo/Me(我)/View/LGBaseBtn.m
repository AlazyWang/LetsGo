//
//  LGBaseBtn.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGBaseBtn.h"


@implementation LGBaseBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageWithNamed:@"userinfo_appsview_background_highlighted"] forState:UIControlStateHighlighted];
        
        // 1.粗体
        self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        
        // 2.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}



@end
