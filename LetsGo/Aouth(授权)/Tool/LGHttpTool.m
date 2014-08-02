//
//  LGHttpTool.m
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGHttpTool.h"
#import "AFNetworking.h"

@implementation LGHttpTool

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure
{

    // 封装请求
    AFHTTPClient* client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:url]];
//    NSMutableDictionary* dicM = [NSMutableDictionary dictionary];
    
//    dicM[@"client_id"] = @"407425450";
//    dicM[@"client_secret"] = @"b1b586217a4e47ba8a208719f8c23fa5";
//    
//    dicM[@"grant_type"] = @"authorization_code";
//    dicM[@"code"] = code;
//    dicM[@"redirect_uri"] = @"http://www.baidu.com";
    

    
    // 注意这个顺序一定要放在dicm赋值后面
    NSURLRequest* request = [client requestWithMethod:@"POST" path:nil parameters:params];
    
    //发送请求
    NSOperation* opertion = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation* operation, id responseObject) {
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"----%@----",json);
        
        if (success) {
            success(json);
        }
        
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
        if (failure) {
            failure(error);
        }
    
    
    }];
    [opertion start];

}


@end
