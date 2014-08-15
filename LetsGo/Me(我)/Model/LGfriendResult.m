//
//  LGfriendResult.m
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGfriendResult.h"
#import "MJExtension.h"
#import "LGUser.h"

@implementation LGfriendResult

- (NSDictionary *)arrayModelClasses
{
    return @{@"users": [LGUser class]};
}

@end
