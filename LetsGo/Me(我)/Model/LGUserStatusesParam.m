//
//  LGUserStatusesParam.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGUserStatusesParam.h"
#import "LGAccount.h"

@implementation LGUserStatusesParam

-(id)init
{
    if (self = [super init]) {
        _uid = [LGAccount currentAccount].uid;
    }
    
    return self;
}

@end
