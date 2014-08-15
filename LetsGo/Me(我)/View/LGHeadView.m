//
//  LGHeadView.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGHeadView.h"
#import "LGIconView.h"
#import "LGUser.h"
#import "UIImageView+WebCache.h"
#import "LGNumber.h"
#import "LGMoreBtn.h"

@interface LGHeadView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UIImageView *sexView;

@property (weak, nonatomic) IBOutlet LGIconView *iconView;

@property (weak, nonatomic) IBOutlet UIButton *detailBtn;

@property (weak, nonatomic) IBOutlet UILabel *detailLable;

@property (weak, nonatomic) IBOutlet UIView *btnsView;

@end

@implementation LGHeadView



+ (id)header
{
    return [[NSBundle mainBundle] loadNibNamed:@"LGHeadView" owner:nil options:nil][0];
}


- (void)awakeFromNib
{
    [_detailBtn setBackgroundImage:[UIImage resizeWithName:@"userinfo_relationship_button_background"] forState:UIControlStateNormal];
    
    [_detailBtn setBackgroundImage:[UIImage resizeWithName:@"userinfo_relationship_button_highlighted"] forState:UIControlStateHighlighted];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (void)setUser:(LGUser *)user
{
    _user = user;
    
    [self setUpTopViews:user];
    
    [self setUpBottomBtns];
}

- (void)setUpTopViews:(LGUser *)user
{
    
    
    _iconView.layer.shadowColor = [UIColor grayColor].CGColor;
    _iconView.layer.shadowOpacity = 0.5;
    _iconView.layer.shadowOffset = CGSizeMake(0, 2);
    [_iconView setUser:user iconType:LGIconTypeBig];
    
    if (_user.desc.length) {
        _detailLable.text = _user.desc;
    }
    
    _nameLable.text = _user.name;
    CGRect nameF= _nameLable.frame;
    
    CGFloat nameMaxWidth = self.frame.size.width - nameF.origin.x - 20 - _sexView.image.size.width;
    
    nameF.size = [_user.name sizeWithFont:_nameLable.font constrainedToSize:CGSizeMake(nameMaxWidth, MAXFLOAT)];
    
    _nameLable.frame = nameF;
    
    if ([_user.gender isEqualToString:@"m"]) {
        _sexView.image = [UIImage imageWithNamed:@"userinfo_icon_male"];
    } else
    {
        _sexView.image = [UIImage imageWithNamed:@"userinfo_icon_female"];
        
    }
    
    CGRect sexF = _sexView.frame;
    
    sexF.origin.x = CGRectGetMaxX(_nameLable.frame) + 10;
    _sexView.frame = sexF;
}

- (void)setUpBottomBtns
{
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = 0.5;
    
    UIView *divider = [[UIView alloc]init];
    divider.backgroundColor = [UIColor grayColor];
    
    divider.alpha = 0.2;
    
    CGFloat dividerW  = _btnsView.frame.size.width;
    
    CGFloat dividerH = 0.5;
    divider.frame = CGRectMake(0, 0, dividerW, dividerH);
    [_btnsView addSubview:divider];
    
    
    [self addBottomBtn:0 number:_user.statuses_count tilte:@"微博" action:@selector(weiboClick)];
     [self addBottomBtn:1 number:_user.friends_count tilte:@"关注" action:@selector(friendsClick)];
     [self addBottomBtn:2 number:_user.statuses_count tilte:@"粉丝" action:@selector(followerClick)];
     [self addBottomBtn:3 number:0 tilte:@"赞" action:nil];
    
    
    CGFloat btnW = _btnsView.frame.size.width / 5;
    CGFloat btnH = _btnsView.frame.size.height;
    LGMoreBtn *more = [LGMoreBtn buttonWithType:UIButtonTypeCustom];
    
    more.frame = CGRectMake(btnW * 4, 0, btnW, btnH);
    
    [more setImage:[UIImage imageWithNamed:@"userinfo_apps_more"] forState:UIControlStateNormal];
    
    [more setTitle:@"更多" forState:UIControlStateNormal];
    
    [_btnsView addSubview:more];
    
}

- (void)weiboClick
{
    if ([self.delegate respondsToSelector:@selector(headViewWeiboClick:)]) {
        [_delegate headViewWeiboClick:self];
    }
}

- (void)friendsClick
{
    if ([self.delegate respondsToSelector:@selector(headViewFriendsClick:)]) {
        [_delegate headViewFriendsClick:self];
    }
}

- (void)followerClick
{
    if ([self.delegate respondsToSelector:@selector(headViewFollowerClick:)]) {
        [_delegate headViewFollowerClick:self];
    }
}

- (void)addBottomBtn:(int)index number:(int)number tilte:(NSString *)title action:(SEL)action
{
    LGNumber *btn = [LGNumber buttonWithType:UIButtonTypeCustom];
    
    CGFloat btnW = _btnsView.frame.size.width / 5;
    
    CGFloat btnH = _btnsView.frame.size.height;
    
    CGFloat btnX = btnW *index;
    
    btn.frame = CGRectMake(btnX, 0, btnW, btnH);
    
    [btn setNumber:number title:title];
    
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    [_btnsView addSubview:btn];
    
  
        UIView *divider = [[UIView alloc]init];
        
        divider.backgroundColor = [UIColor grayColor];
        
        divider.alpha = 0.2;
        
        CGFloat dividerW = 0.5;
        CGFloat dividerH = 30;
        CGFloat dividerY = (btnH - dividerH) * 0.5;
        divider.frame = CGRectMake(CGRectGetMaxX(btn.frame), dividerY, dividerW, dividerH);
        
        [_btnsView addSubview:divider];

    
}

@end
