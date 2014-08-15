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
        [self loadData];
    }
    return self;
}

- (void)loadData
{
    _imageView = [[UIImageView alloc]init];
    [self addSubview:_imageView];
    
    _vertifyView = [[UIImageView alloc]init];
    CGFloat vertifyX = self.frame.size.width - LGVertifyWH;
    CGFloat vertifyY = self.frame.size.height - LGVertifyWH;
    _vertifyView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    _vertifyView.frame = CGRectMake(vertifyX, vertifyY, LGVertifyWH, LGVertifyWH);
    [self addSubview:_vertifyView];
}

- (void)awakeFromNib
{
    [self loadData];
}

- (void)setUser:(LGUser *)user
{
    _user = user;
    
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

- (void)setUser:(LGUser *)user iconType:(LGIconType )iconType
{
    self.user = user;
    self.iconType = iconType;
}

- (void)setIconType:(LGIconType)iconType
{
    _iconType = iconType;
    CGFloat imageWH = 0;
    switch (iconType) {
        case LGIconTypeBig:
            imageWH = LGIconWHBig;
             [_imageView setImageWithURL:[NSURL URLWithString:_user.avatar_hd] placeholderImage:[UIImage imageWithNamed:@"avatar_default_big"]];
            break;
            
        case LGIconTypeDefault:
            imageWH = LGIconWHDefault;
             [_imageView setImageWithURL:[NSURL URLWithString:_user.avatar_large] placeholderImage:[UIImage imageWithNamed:@"avatar_default"]];
            break;
            
        case LGIconTypeSmall:
            imageWH = LGIconWHSmall;
             [_imageView setImageWithURL:[NSURL URLWithString:_user.profile_image_url] placeholderImage:[UIImage imageWithNamed:@"avatar_default_small"]];
            break;
        
    }
    
    _imageView.frame = CGRectMake(0, 0, imageWH, imageWH);
    CGFloat iconWH = imageWH + LGVertifyWH * 0.5;
//    CGRect bounds = CGRectMake(0, 0, iconWH, iconWH);
//    [super setBounds:bounds];
    CGRect frame = self.frame;
    frame.size = CGSizeMake(iconWH, iconWH);
    [super setFrame:frame];
    
}

+ (CGSize)iconSizeWithIconType:(LGIconType)iconType
{
    CGFloat imageWH = 0;
    switch (iconType) {
        case LGIconTypeBig:
            imageWH = LGIconWHBig;
            break;
            
        case LGIconTypeDefault:
            imageWH = LGIconWHDefault;
            break;
            
        case LGIconTypeSmall:
            imageWH = LGIconWHSmall;
            break;
            
    }
    
    CGFloat iconWH = imageWH + LGVertifyWH * 0.5;
    return CGSizeMake(iconWH, iconWH);
}

- (void)setFrame:(CGRect)frame
{
    frame.size = self.frame.size;
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds
{
    bounds.size = self.bounds.size;
    [super setBounds:bounds];
}


@end
