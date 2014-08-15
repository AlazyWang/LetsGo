//
//  LGIconView.h
//  LetsGo
//
//  Created by robert on 14-8-8.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LGIconTypeDefault,
    LGIconTypeBig,
    LGIconTypeSmall
} LGIconType;

@class LGUser;
@interface LGIconView : UIView

@property(nonatomic,strong)LGUser *user;
@property(nonatomic,assign)LGIconType iconType;

+ (CGSize)iconSizeWithIconType:(LGIconType)iconType;

- (void)setUser:(LGUser *)user iconType:(LGIconType )iconType;

@end
