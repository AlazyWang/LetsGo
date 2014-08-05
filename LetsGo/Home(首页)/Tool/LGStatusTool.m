//
//  LGStatus.m
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatusTool.h"

#import "LGStatus.h"
#import "LGFriendStatusesResult.h"
#import "MJExtension.h"
#import "LGFriendStatusesParam.h"



@implementation LGStatusTool
+ (void)statusesWithAccessToken:(NSString *)accessToken success:(StatusSuccess)success failure:(HttpFailure)failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = accessToken;
    
    [LGHttpTool getWithURL:@"https://api.weibo.com/2/statuses/friends_timeline.json" params:params success:^(id json) {
        NSArray *statusDic = json[@"statuses"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dic in statusDic) {
            LGStatus *status = [[LGStatus alloc]init];
            [status setKeyValues:dic];
            [arrayM addObject:status];
            
        }
        
        if (success) {
            success(arrayM);
        }
    } failure:^(NSError *error) {
        
    }];
}

+ (void)statusesWithAccessParam:(LGFriendStatusesParam *)param success:(LGFriendStatusesSuccess)success failure:(HttpFailure)failure
{
    NSDictionary *params = param.keyValues;
    [LGHttpTool getWithURL:@"https://api.weibo.com/2/statuses/friends_timeline.json" params:params success:^(id json) {
        if (success) {
//            LGFriendStatusesResult *result = [LGFriendStatusesResult objectWithKeyValues:json];
            LGFriendStatusesResult *result = [[LGFriendStatusesResult alloc]init];
            [result setKeyValues:json];
            success(result);
        }
    } failure:^(NSError *error) {
        
    }];
}
@end
