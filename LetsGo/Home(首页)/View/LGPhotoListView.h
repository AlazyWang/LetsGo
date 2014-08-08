//
//  LGPhotoListView.h
//  LetsGo
//
//  Created by robert on 14-8-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGPhotoListView : UIView
@property (nonatomic,strong) NSArray *pic_urls;


+ (CGSize)photoListSizeWithCount:(int)count;
@end
