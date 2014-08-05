//
//  LGFriendStatusesResult.m
//  LetsGo
//
//  Created by robert on 14-8-5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGFriendStatusesResult.h"
#import "MJExtension.h"
#import "LGStatus.h"

@implementation LGFriendStatusesResult
- (NSDictionary *)arrayModelClasses
{
    return @{@"statuses": [LGStatus class]};
}
@end
