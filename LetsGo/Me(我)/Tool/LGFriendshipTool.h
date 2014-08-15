//
//  LGFriendshipTool.h
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHttpTool.h"

@class LGfriendParam,LGfriendResult;

typedef void(^LGFrendSuccess)(LGfriendResult *result);

@interface LGFriendshipTool : NSObject



+ (void)friendWithParam:(LGfriendParam *)param success:(LGFrendSuccess)success failure:(HttpFailure)failure;

+ (void)followerWithParam:(LGfriendParam *)param success:(LGFrendSuccess)success failure:(HttpFailure)failure;


@end
