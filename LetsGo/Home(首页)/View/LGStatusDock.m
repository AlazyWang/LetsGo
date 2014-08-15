//
//  LGStatusDock.m
//  LetsGo
//
//  Created by robert on 14-8-8.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatusDock.h"

#import "LGStatus.h"

@interface LGStatusDock ()

//reposts_count;
///** int	评论数 */
//@property (nonatomic, assign) int comments_count;
///** int	表态数 */
//@property (nonatomic, assign) int attitudes_count

@property (nonatomic,strong) UIButton *reposts;
@property (nonatomic,strong) UIButton *comments;
@property (nonatomic,strong) UIButton *attitudes;

@property (nonatomic,strong) UIView *diver;

@end

@implementation LGStatusDock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizeWithName:@"timeline_card_bottom_background"];
        
     
        
       _reposts =[self addDockBtn:@"timeline_icon_retweet" selectImage:@"timeline_card_leftbottom_highlighted" index:0 title:@"转发"];
       _comments =[self addDockBtn:@"timeline_icon_comment" selectImage:@"timeline_card_middlebottom_highlighted" index:1 title:@"评论"];
       _attitudes = [self addDockBtn:@"timeline_icon_unlike" selectImage:@"timeline_card_rightbottom_highlighted" index:2 title:@"赞"];
       
    }
    return self;
}

- (UIButton *)addDockBtn:(NSString *)imageName selectImage:(NSString*)selectImage index:(int)index title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat btnW = self.frame.size.width / 3;
    CGFloat btnX = index *btnW;
    CGFloat btnH = self.frame.size.height;
    
    button.frame = CGRectMake(btnX, 0, btnW, btnH);
    
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchDown];
    
    [button setImage:[UIImage imageWithNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizeWithName:selectImage] forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    button.adjustsImageWhenHighlighted = NO;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [button setTitle:title forState:UIControlStateNormal];
    [self addSubview:button];
    
    UIView *view = [[UIView alloc]init];
    [self addSubview:view];
    view.backgroundColor = LGglobalColor;
  
    
    if (index == 0) {
        view.hidden = YES;
        
    } else
    {
        CGFloat diverCenterX = btnX;
        CGFloat diverCenterY= btnH / 2;
        CGFloat diverWidth = 1;
        CGFloat diverHeight = btnH / 2;
        view.center = CGPointMake(diverCenterX, diverCenterY);
        view.bounds = CGRectMake(0, 0, diverWidth, diverHeight);
        view.hidden = NO;

    }
    
    return button;
}

- (void)btnClick
{
   
}

- (void)setStatus:(LGStatus *)status
{
    _status = status;
    
    
    [self setBtn:_reposts number:status.reposts_count];
    [self setBtn:_comments number:status.comments_count];
    [self setBtn:_attitudes number:status.attitudes_count];
    
    
}

- (void)setBtn:(UIButton*)btn number:(int)number
{
    if (number > 10000) {
//        btn.titleLabel.text =[NSString stringWithFormat:@"%d万",number / 10000];
        [btn setTitle:[NSString stringWithFormat:@"%d万",number / 10000] forState:UIControlStateNormal];
    } else if(number > 0)
    {
        [btn setTitle:[NSString stringWithFormat:@"%d",number] forState:UIControlStateNormal];
 
    }
}

@end
