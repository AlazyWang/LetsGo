//
//  LGStatus.h
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGAccount.h"
#import "LGStatus.h"
@class LGFriendStatusesParam,LGFriendStatusesResult,LGUserStatusesParam,LGUserStatusesResult,LGSendParam;
typedef void(^LGFriendStatusesSuccess)(LGFriendStatusesResult *result);

typedef void(^StatusSuccess)(NSArray *status);

typedef void(^SendStatusSuccess)(LGUser *status);

typedef void(^UserStatusSuccess)(LGUserStatusesResult *result);

@interface LGStatusTool : NSObject

+ (void)statusesWithAccessToken:(NSString *)accessToken success:(StatusSuccess)success failure:(HttpFailure)failure;

+ (void)sendStatusParam:(LGSendParam *)param success:(SendStatusSuccess)success failure:(HttpFailure)failure;

+ (void)statusesWithAccessParam:(LGFriendStatusesParam *)param success:(LGFriendStatusesSuccess)success failure:(HttpFailure)failure;

+ (void)userStatusesWithParam:(LGUserStatusesParam *)param success:(UserStatusSuccess)success failure:(HttpFailure)failure;

@end
