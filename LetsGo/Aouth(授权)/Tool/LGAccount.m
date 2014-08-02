//
//  LGAccount.m
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGAccount.h"

static LGAccount *_currentAccount;
@implementation LGAccount


//解档
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [aDecoder decodeObjectForKey:@"access_token"];
        [aDecoder decodeObjectForKey:@"exprires_in"];
        [aDecoder decodeObjectForKey:@"uid"];
        
        
    }
    
    return self;
}

+ (void )savaAccount:(LGAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:Kpath];
}

+(LGAccount *)currentAccount
{
    if (!_currentAccount) {
        _currentAccount = [NSKeyedUnarchiver unarchiveObjectWithFile:Kpath];
    }
    return _currentAccount;
}

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"exprires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}


+(void)getAccessToken:(NSString *)code success:(AccessTokenSuccess)success failure:(HttpFailure)failure
{

    NSMutableDictionary* dicM = [NSMutableDictionary dictionary];
    
    dicM[@"client_id"] = @"407425450";
    dicM[@"client_secret"] = @"b1b586217a4e47ba8a208719f8c23fa5";
    
    dicM[@"grant_type"] = @"authorization_code";
    dicM[@"code"] = code;
    dicM[@"redirect_uri"] = @"http://www.baidu.com";
    
    
    [LGHttpTool postWithURL:@"https://api.weibo.com/oauth2/access_token" params:dicM success:^(id json) {
        
        LGAccount *account = [[LGAccount alloc]init];

        account.uid = json[@"uid"];
        account.expires_in = json[@"exprires_in"];
        account.access_token = json[@"exprires_in"];

        [LGAccount savaAccount:account];
        if (success) {
            success();
        }

        
    } failure:^(NSError *error) {
        NSLog(@"--%@---",error);
    }];
    
    
    
 
}
@end
