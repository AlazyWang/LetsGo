//
//  LGFriendShipCell.m
//  LetsGo
//
//  Created by robert on 14-8-14.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGFriendShipCell.h"
#import "LGIconView.h"
#import "LGUser.h"

#import "LGStatus.h"


@interface LGFriendShipCell ()
@property (weak, nonatomic) IBOutlet LGIconView *iconVIew;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stationLabel;

@property (weak, nonatomic) IBOutlet UIButton *followBtn;


@end

@implementation LGFriendShipCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [_followBtn setBackgroundImage:[UIImage resizeWithName:@"userinfo_relationship_button_background"] forState:UIControlStateNormal];
    [_followBtn setBackgroundImage:[UIImage resizeWithName:@"userinfo_relationship_button_highlighted"] forState:UIControlStateHighlighted];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setUser:(LGUser *)user
{
    _user = user;
    
    [_iconVIew setUser:user iconType:LGIconTypeDefault];
    
    _nameLabel.text = user.name;
    
    _stationLabel.text = user.status.text;
    
    if (user.following && user.follow_me)
    {
        [_followBtn setTitle:@"相互关注" forState:UIControlStateNormal];
        
        [_followBtn setImage:[UIImage imageWithNamed:@"userinfo_relationship_indicator_arrow"] forState:UIControlStateNormal];
        
        
    } else if (user.following){
        
        [_followBtn setTitle:@"已关注" forState:UIControlStateNormal];
        
        [_followBtn setImage:[UIImage imageWithNamed:@"userinfo_relationship_indicator_tick_unfollow"] forState:UIControlStateNormal];
        
    } else{
        
        [_followBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_followBtn setImage:[UIImage imageWithNamed:@"userinfo_relationship_indicator_plus"] forState:UIControlStateNormal];
    }
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friendship";
    
    LGFriendShipCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell= [[NSBundle mainBundle] loadNibNamed:@"LGFriendShipCell" owner:nil options:nil][0];
    }
    
    return cell;
    
    
}








@end
