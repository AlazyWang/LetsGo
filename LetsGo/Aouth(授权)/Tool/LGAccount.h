//
//  LGAccount.h
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGHttpTool.h"

typedef void(^AccessTokenSuccess)();

@interface LGAccount : NSObject <NSCoding>
@property(nonatomic,strong)NSString *access_token;
@property(nonatomic,strong)NSString *expires_in;
@property(nonatomic,strong)NSString *uid;

+ (void)getAccessToken:(NSString *)code success:(AccessTokenSuccess)success failure:(HttpFailure)failure;
+ (void )savaAccount:(LGAccount *)account;
+ (LGAccount *)currentAccount;

@end
