//
//  LGStatusCell.h
//  LetsGo
//
//  Created by robert on 14-8-6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGStatusFrame;

@interface LGStatusCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView*)tableView;

@property(nonatomic,strong)LGStatusFrame *statusFrame;

@end
