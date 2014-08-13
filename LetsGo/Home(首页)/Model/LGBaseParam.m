//
//  LGBaseParam.m
//  LetsGo
//
//  Created by robert on 14-8-12.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGBaseParam.h"
#import "LGAccount.h"


@implementation LGBaseParam

- (id)init{
    self = [super init];
    if (self) {
        _access_token = [LGAccount currentAccount].access_token;
    }
    return self;
}



@end

