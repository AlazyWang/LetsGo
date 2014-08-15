//
//  LGfriendParam.m
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGfriendParam.h"
#import "LGAccount.h"

@implementation LGfriendParam

- (id)init
{
    if (self = [super init]) {
        _uid = [LGAccount currentAccount].uid;
        _trim_status = @0;
    }
    return self;
}

@end
