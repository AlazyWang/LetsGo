//
//  LGIconView.m
//  LetsGo
//
//  Created by robert on 14-8-8.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGIconView.h"

#import "UIImageView+WebCache.h"
#import "LGUser.h"

@interface LGIconView ()

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UIImageView *vertifyView;


@end

@implementation LGIconView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, 34, 34);
        [self addSubview:_imageView];
        
        _vertifyView = [[UIImageView alloc]init];
        CGFloat vertifyX = frame.size.width - 18;
        CGFloat vertifyY = frame.size.height - 18;
        _vertifyView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        _vertifyView.frame = CGRectMake(vertifyX, vertifyY, 18, 18);
        [self addSubview:_vertifyView];
    }
    return self;
}


- (void)setUser:(LGUser *)user
{
    _user = user;
    [_imageView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
    
    switch (user.verified_type) {
        case IWVerifiedTypeNone: // 没有认证
            _vertifyView.hidden = YES;
            break;
        case IWVerifiedTypeDaren: // 微博达人
            _vertifyView.hidden = NO;
            _vertifyView.image = [UIImage imageWithNamed:@"avatar_grassroot"];
            break;
        case IWVerifiedTypePersonal: // 个人认证
            _vertifyView.hidden = NO;
            _vertifyView.image = [UIImage imageWithNamed:@"avatar_vip"];
            break;
        default: // 企业认证
            _vertifyView.hidden = NO;
            _vertifyView.image = [UIImage imageWithNamed:@"avatar_enterprise_vip"];
            break;
    }
}


@end
