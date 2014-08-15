//
//  LGFriendShipCell.h
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGUser;
@interface LGFriendShipCell : UITableViewCell
@property (nonatomic,strong)LGUser *user;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
