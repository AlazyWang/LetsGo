//
//  LGStatus.h
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LGUser;
@interface LGStatus : NSObject
/** string	字符串型的微博UID */
@property (nonatomic, copy) NSString *idstr;
/** string	微博信息内容 */
@property (nonatomic, copy) NSString *text;
/** string	微博来源 */
@property (nonatomic, copy) NSString *source;
/** int	转发数 */
@property (nonatomic, assign) int reposts_count;
/** int	评论数 */
@property (nonatomic, assign) int comments_count;
/** int	表态数 */
@property (nonatomic, assign) int attitudes_count;

/** object	微博作者的用户信息字段 详细 */
@property (nonatomic, strong) LGUser *user;

/** object	被转发的原微博信息字段，当该微博为转发微博时返回 详细 */
@property (nonatomic, strong) LGStatus *retweeted_status;
@end
