//
//  LGUserTool.h
//  LetsGo
//
//  Created by robert on 14-8-5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHttpTool.h"

@class LGUserInfoParam,LGUser;

typedef void(^LGUserInfoSuccess)(LGUser *user);

@interface LGUserTool : NSObject



+ (void)userInfoParam:(LGUserInfoParam *)param success:(LGUserInfoSuccess)success failure:(HttpFailure)failure;



@end
