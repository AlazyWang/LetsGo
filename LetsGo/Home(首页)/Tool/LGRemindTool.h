//
//  LGRemindTool.h
//  LetsGo
//
//  Created by robert on 14-8-12.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHttpTool.h"

@class LGUnreadParam,LGUnreadResult;

typedef void(^LGUnreadSuccess)(LGUnreadResult *result);

@interface LGRemindTool : NSObject






+ (void)unreadWithParam:(LGUnreadParam *)param success:(LGUnreadSuccess)success failure:(HttpFailure)failure;



@end
