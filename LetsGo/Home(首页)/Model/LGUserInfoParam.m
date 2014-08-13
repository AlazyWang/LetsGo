//
//  LGUserInfoParam.m
//  LetsGo
//
//  Created by robert on 14-8-5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGUserInfoParam.h"
#import "LGAccount.h"


@implementation LGUserInfoParam

- (id)init
{
    if (self = [super init]) {
        _uid = [LGAccount currentAccount].uid;
    }
    return self;
}

@end
