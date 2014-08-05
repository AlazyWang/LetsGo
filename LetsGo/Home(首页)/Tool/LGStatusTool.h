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
@class LGFriendStatusesParam,LGFriendStatusesResult;
typedef void(^LGFriendStatusesSuccess)(LGFriendStatusesResult *result);

typedef void(^StatusSuccess)(NSArray *status);

@interface LGStatusTool : NSObject

+ (void)statusesWithAccessToken:(NSString *)accessToken success:(StatusSuccess)success failure:(HttpFailure)failure;

+ (void)statusesWithAccessParam:(LGFriendStatusesParam *)param success:(LGFriendStatusesSuccess)success failure:(HttpFailure)failure;

@end
