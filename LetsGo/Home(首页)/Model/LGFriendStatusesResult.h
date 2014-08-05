//
//  LGFriendStatusesResult.h
//  LetsGo
//
//  Created by robert on 14-8-5.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGFriendStatusesResult : NSObject
//"previous_cursor": 0,      // 暂时不支持
@property (nonatomic,assign) long long previous_cursor;

//"next_cursor": 11488013766,     // 暂时不支持
@property (nonatomic,assign) long long next_cursor;

//"total_number": 81655
@property (nonatomic,assign) int total_number;
//statuses
@property (nonatomic,strong) NSArray *statuses;
@end
