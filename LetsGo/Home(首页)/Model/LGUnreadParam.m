//
//  LGUnreadParam.m
//  LetsGo
//
//  Created by robert on 14-8-12.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGUnreadParam.h"
#import "LGAccount.h"

@interface LGUnreadParam ()



@end

@implementation LGUnreadParam

- (id)init
{
    if (self = [super init]) {
        _uid = [LGAccount currentAccount].uid;
    }
    
    return self;
}

@end
