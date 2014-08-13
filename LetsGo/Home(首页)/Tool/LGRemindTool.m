//
//  LGRemindTool.m
//  LetsGo
//
//  Created by robert on 14-8-12.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGRemindTool.h"
#import "LGUnreadParam.h"
#import "LGUnreadResult.h"
#import "MJExtension.h"
@implementation LGRemindTool


+ (void)unreadWithParam:(LGUnreadParam *)param success:(LGUnreadSuccess)success failure:(HttpFailure)failure;
{
    NSDictionary *params = param.keyValues;
    
    [LGHttpTool getWithURL:@"https://rm.api.weibo.com/2/remind/unread_count.json" params:params success:^(id json) {
        if (success) {
            LGUnreadResult *result = [LGUnreadResult objectWithKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        
    }];
}

@end
