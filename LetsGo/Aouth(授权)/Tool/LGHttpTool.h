//
//  LGHttpTool.h
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpSuccess)(id json);

typedef void(^HttpFailure)(NSError* error);

@interface LGHttpTool : NSObject

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(HttpSuccess)success failure:(HttpFailure)failure;

@end
