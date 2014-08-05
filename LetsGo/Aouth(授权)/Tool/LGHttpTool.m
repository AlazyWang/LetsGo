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
    [self getMethod:@"POST" withURL:url params:params success:success failure:failure];
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure
{
    
    [self getMethod:@"GET" withURL:url params:params success:success failure:failure];
    
}

+ (void)getMethod:(NSString *)method withURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure
{
    // 封装请求
    AFHTTPClient* client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:url]];
    
    // 注意这个顺序一定要放在dicm赋值后面
    NSURLRequest* request = [client requestWithMethod:method path:nil parameters:params];
    
    //发送请求
    NSOperation* opertion = [client HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation* operation, id responseObject) {
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        //        NSLog(@"----%@----",json);
        
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
