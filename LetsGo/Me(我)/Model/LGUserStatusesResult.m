//
//  LGUserStatusesResult.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGUserStatusesResult.h"
#import "MJExtension.h"
#import "LGStatus.h"

@implementation LGUserStatusesResult
- (NSDictionary *)arrayModelClasses
{
    return @{@"statuses": [LGStatus class]};
}

@end
