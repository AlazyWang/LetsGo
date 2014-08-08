//
//  LGUser.h
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//
typedef enum {
    IWMBTypeNone = 0, // 没有
    IWMBTypeNormal, // 普通
    IWMBTypeYear // 年费
} IWMBType;


#import <Foundation/Foundation.h>

@interface LGUser : NSObject
/** string	字符串型的用户UID */
@property (nonatomic, copy) NSString *idstr;

/** string	友好显示名称 */
@property (nonatomic, copy) NSString *name;

/** string	用户个人描述 本来是description */
@property (nonatomic, copy) NSString *desc;

/** string	用户头像地址（中图），50×50像素 */
@property (nonatomic, copy) NSString *profile_image_url;
/** string	用户头像地址（大图），180×180像素 */
@property (nonatomic, copy) NSString *avatar_large;
/** string	用户头像地址（高清），高清头像原图 */
@property (nonatomic, copy) NSString *avatar_hd;
/** string	性别，m：男、f：女、n：未知 */
@property (nonatomic, copy) NSString *gender;

/**	int	粉丝数 */
@property (nonatomic, assign) int followers_count;
/**	int	关注数 */
@property (nonatomic, assign) int friends_count;
/**	int	微博数 */
@property (nonatomic, assign) int statuses_count;

@property (nonatomic, assign) IWMBType mbtype;

@end
