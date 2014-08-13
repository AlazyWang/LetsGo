//
//  LGHeadView.h
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGUser,LGHeadView;

@protocol LGMeHeadViewDelegate <NSObject>

@optional

- (void)headViewWeiboClick:(LGHeadView *)headView;
- (void)headViewFriendsClick:(LGHeadView *)headView;
- (void)headViewFollowerClick:(LGHeadView *)headView;

@end

@interface LGHeadView : UIView

+ (id)header;

@property (nonatomic,strong) LGUser *user;

@property (nonatomic,weak) id<LGMeHeadViewDelegate>delegate;

@end
