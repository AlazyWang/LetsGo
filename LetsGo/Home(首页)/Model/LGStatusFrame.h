//
//  LGStatusFrame.h
//  LetsGo
//
//  Created by robert on 14-8-6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LGStatus,LGPhotoListView;
@interface LGStatusFrame : NSObject
/** 头像 */
@property (nonatomic, assign, readonly) CGRect iconViewF;
/** 昵称 */
@property (nonatomic, assign, readonly) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign, readonly) CGRect timeLabelF;
/** 来源 */
@property (nonatomic, assign, readonly) CGRect sourceLabelF;
/** 内容 */
@property (nonatomic, assign, readonly) CGRect contentLabelF;
/** 配图 */
@property (nonatomic, assign, readonly) CGRect photoListViewF;
/** 微博会员图标 */
@property (nonatomic, assign, readonly) CGRect mbViewF;

/** 转发微博的整体 */
@property (nonatomic, assign, readonly) CGRect retweetViewF;
/** 转发微博的昵称 */
@property (nonatomic, assign, readonly) CGRect retweetNameLabelF;
/** 转发微博的配图 */
@property (nonatomic, assign, readonly) CGRect retweetPhotoListViewF;
/** 转发微博的内容 */
@property (nonatomic, assign, readonly) CGRect retweetContentLabelF;


/** 转发微博的内容 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, assign, readonly) CGFloat statusDock;


@property (nonatomic,strong)LGStatus *status;
@end
