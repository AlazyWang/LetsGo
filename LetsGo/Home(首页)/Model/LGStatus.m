//
//  LGStatus.m
//  LetsGo
//
//  Created by robert on 14-8-2.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatus.h"
#import "LGUser.h"
#import "MJExtension.h"
#import "LGPhoto.h"


@implementation LGStatus

- (void)setSource:(NSString *)source
{

    int loc = [source rangeOfString:@">"].location + 1;
    int len = [source rangeOfString:@"</"].location - loc;
    _source = [source substringWithRange:NSMakeRange(loc, len)];

}

- (NSString *)created_at
{
    NSDateFormatter *oldFormatter = [[NSDateFormatter alloc]init];
    oldFormatter.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    NSDate *oldData = [oldFormatter dateFromString:_created_at];
    
    NSDateFormatter *newFormatter = [[NSDateFormatter alloc]init];
    newFormatter.dateFormat = @"MM月dd日 HH:mm";
    NSString *newTime = [newFormatter stringFromDate:oldData];
    NSDate *now = [NSDate date];
    
    double delta = [now timeIntervalSinceDate:oldData];
    
    if (delta < 60) {
        newTime = @"刚刚";
    } else if (delta < 60 * 60)
    {
        newTime = [NSString stringWithFormat:@"%.f分钟前",delta / 60];
    } else if (delta < 60 * 60 * 24) { // 一天内
        newTime = [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else { // 几天前
        
    }
    
    return  newTime;
    
}

- (NSDictionary *)arrayModelClasses
{
    return @{@"pic_urls": [LGPhoto class]};
}

@end
