//
//  LGFriendshipTool.m
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGFriendshipTool.h"
#import "LGfriendParam.h"
#import "LGfriendResult.h"
#import "MJExtension.h"

@implementation LGFriendshipTool

+ (void)friendWithParam:(LGfriendParam *)param success:(LGFrendSuccess)success failure:(HttpFailure)failure
{
    NSDictionary *params = param.keyValues;
    if (success) {
        [LGHttpTool getWithURL:@"https://api.weibo.com/2/friendships/friends.json" params:params success:^(id json) {
            LGfriendResult *result = [[LGfriendResult alloc]init];
            
            [result setKeyValues:json];
            
            success(result);
            
        } failure:nil];
    }
}

+ (void)followerWithParam:(LGfriendParam *)param success:(LGFrendSuccess)success failure:(HttpFailure)failure
{
    NSDictionary *params = param.keyValues;
    if (success) {
        [LGHttpTool getWithURL:@"https://api.weibo.com/2/friendships/followers.json" params:params success:^(id json) {
            LGfriendResult *result = [[LGfriendResult alloc]init];
            
            [result setKeyValues:json];
            
            success(result);
            
        } failure:nil];
    }
}

@end
