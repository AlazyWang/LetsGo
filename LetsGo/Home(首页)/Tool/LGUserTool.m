//
//  LGUserTool.m
//  LetsGo
//
//  Created by robert on 14-8-5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGUserTool.h"
#import "LGUserInfoParam.h"
#import "LGUser.h"
#import "MJExtension.h"

@implementation LGUserTool

+ (void)userInfoParam:(LGUserInfoParam *)param success:(LGUserInfoSuccess)success failure:(HttpFailure)failure
{
    NSDictionary *params = param.keyValues;
    [LGHttpTool getWithURL:@"https://api.weibo.com/2/users/show.json" params:params success:^(id json) {
        LGUser *user = [[LGUser alloc]init];
        [user setKeyValues:json];
        success(user);
    } failure:^(NSError *error) {
        
    }];
}
@end
