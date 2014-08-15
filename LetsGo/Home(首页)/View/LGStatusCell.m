//
//  LGStatusCell.m
//  LetsGo
//
//  Created by robert on 14-8-6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatusCell.h"
#import "UIImage+LG.h"
#import "LGStatus.h"
#import "LGUser.h"
#import "LGStatusFrame.h"
#import "UIImageView+WebCache.h"
#import "LGPhotoListView.h"
#import "LGStatusDock.h"
#import "LGIconView.h"
#import "TQRichTextView.h"


@interface LGStatusCell () <TQRichTextViewDelegate>
{
    /** 头像 */
    LGIconView *_iconView;
    /** 昵称 */
    UILabel *_nameLabel;
    /** 时间 */
    UILabel *_timeLabel;
    /** 来源 */
    UILabel *_sourceLabel;
    /** 内容 */
    TQRichTextView *_contentLabel;
    /** 配图 */
    LGPhotoListView *_photoListView;
    /** 微博会员图标 */
    UIImageView *_mbView;
    
    /** 转发微博的整体 */
    UIImageView *_retweetView;
    /** 转发微博的昵称 */
    UILabel *_retweetNameLabel;
    /** 转发微博的配图 */
    LGPhotoListView *_retweetPhotoListView;
    /** 转发微博的内容 */
    TQRichTextView *_retweetContentLabel;

    LGStatusDock *_statusDock;
}

@end

@implementation LGStatusCell
- (void)setStatusFrame:(LGStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    LGStatus *status = statusFrame.status;
    LGUser *user = status.user;
    
  
    
    
    
    _iconView.frame = statusFrame.iconViewF;
    [_iconView setUser:user iconType:LGIconTypeSmall];
    
    _nameLabel.frame = statusFrame.nameLabelF;
    _nameLabel.text = user.name;
    
    if (user.mbtype == IWMBTypeNone) {
        _mbView.hidden = YES;
        _nameLabel.textColor = IWNameColor;
    } else
    {
        _mbView.hidden = NO;
        _mbView.frame = statusFrame.mbViewF;
        _nameLabel.textColor = IWMBNameColor;
    }
    
    _contentLabel.frame = statusFrame.contentLabelF;
    _contentLabel.text = status.text;
    
    if (status.pic_urls.count) {
        _photoListView.hidden = NO;
        _photoListView.frame = statusFrame.photoListViewF;
        _photoListView.pic_urls = status.pic_urls;
#warning 配图待写
        
    } else
    {
        _photoListView.hidden = YES;
    }
    
    if (status.retweeted_status) {
        _retweetView.hidden = NO;
        _retweetView.frame = statusFrame.retweetViewF;
        
        
        _retweetNameLabel.frame = statusFrame.retweetNameLabelF;
        _retweetNameLabel.text = [NSString stringWithFormat:@"@%@",status.retweeted_status.user.name];
        
        _retweetContentLabel.text = status.retweeted_status.text;
        _retweetContentLabel.frame = statusFrame.retweetContentLabelF;
        
        if (status.retweeted_status.pic_urls.count) {
            _retweetPhotoListView.hidden = NO;
            _retweetPhotoListView.frame = statusFrame.retweetPhotoListViewF;
            _retweetPhotoListView.pic_urls = status.retweeted_status.pic_urls;
#warning 配图待写
        } else
        {
            _retweetPhotoListView.hidden = YES;
        }
    } else
    {
        _retweetView.hidden = YES;
    }

    _timeLabel.text = status.created_at;
    
    CGFloat timeX = CGRectGetMinX(_nameLabel.frame);
    CGSize timeSize = [_timeLabel.text sizeWithFont:IWTimeFont];
    CGFloat timeY = CGRectGetMaxY(_nameLabel.frame) + IWCellBorderWidth * 0.5;
    
    _timeLabel.frame = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    
    _sourceLabel.text = status.source;
    CGFloat sourceX = CGRectGetMaxX(_timeLabel.frame) + IWCellBorderWidth;
    CGSize sourceSize = [status.source sizeWithFont:IWTimeFont];
    CGFloat sourceY = timeY;
    _sourceLabel.frame = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);

    
    _statusDock.status = status;
    
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpOriginSubViews];
        
        
        [self setUpReweetSubViews];
        
        [self setUpStatusDock];
        
        [self setBg];
    }
    return self;
}

- (void)setBg
{
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage resizeWithName:@"common_card_background"]];
    self.backgroundColor = [UIColor clearColor];
    
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *CellIdentifier = @"Cell";
    LGStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[LGStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (void)setUpOriginSubViews
{
    _iconView = [[LGIconView alloc]init];
    [self.contentView addSubview:_iconView];

    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.font = IWNameFont;
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = IWNameColor;
    [self.contentView addSubview:_nameLabel];
    
    // 3.时间
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = IWTimeFont;
    _timeLabel.textColor = IWTimeColor;
    _timeLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_timeLabel];
    
    // 4.来源
    _sourceLabel = [[UILabel alloc] init];
    _sourceLabel.font = IWSourceFont;
    _sourceLabel.textColor = IWSourceColor;
    _sourceLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_sourceLabel];
    
    _contentLabel = [[TQRichTextView alloc]init];
    _contentLabel.delegage = self;
    _contentLabel.font = IWNameFont;
    _contentLabel.textColor = IWContentColor;
    _contentLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_contentLabel];
    
    // 6.配图
    _photoListView = [[LGPhotoListView alloc] init];
    [self.contentView addSubview:_photoListView];
    
    // 7.微博会员图标
    _mbView = [[UIImageView alloc] initWithImage:[UIImage imageWithNamed:@"common_icon_membership"]];
    [self.contentView addSubview:_mbView];
    
}


- (void)setUpReweetSubViews
{
    // 0.整体
    _retweetView = [[UIImageView alloc] init];
    _retweetView.image = [UIImage resizeWithName:@"timeline_retweet_background" width:0.9 hight:0.5];
    [self.contentView addSubview:_retweetView];
    
    // 1.昵称
    _retweetNameLabel = [[UILabel alloc] init];
    _retweetNameLabel.font = IWRetweetNameFont;
    _retweetNameLabel.textColor = IWRetweetNameColor;
    _retweetNameLabel.backgroundColor = [UIColor clearColor];
    [_retweetView addSubview:_retweetNameLabel];
    
    // 2.内容
    _retweetContentLabel = [[TQRichTextView alloc] init];
    _retweetContentLabel.font = IWRetweetContentFont;
    _retweetContentLabel.textColor = IWRetweetContentColor;
    _retweetContentLabel.backgroundColor = [UIColor clearColor];
    [_retweetView addSubview:_retweetContentLabel];
    
    // 3.配图
    _retweetPhotoListView = [[LGPhotoListView alloc] init];
    [_retweetView addSubview:_retweetPhotoListView];
}


- (void)setUpStatusDock
{
    CGFloat dockX = 0;
    CGFloat dockH = LGdockHight;
    CGFloat dockW = self.contentView.frame.size.width;
    CGFloat dockY = self.contentView.frame.size.height - dockH;
    _statusDock = [[LGStatusDock alloc]initWithFrame:CGRectMake(dockX, dockY, dockW, dockH)];
    _statusDock.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [self addSubview:_statusDock];
}

- (void)setFrame:(CGRect)frame
{
    CGFloat frameX = IWTableBorderWidth;
    
    CGFloat frameW = frame.size.width - 2*IWTableBorderWidth;
    
    CGFloat frameY = frame.origin.y;
    
    CGFloat frameH = frame.size.height - IWCellMargin;
    frame = CGRectMake(frameX, frameY, frameW, frameH);
    
    [super setFrame:frame];
}


- (void)richTextView:(TQRichTextView *)view touchBeginRun:(TQRichTextRun *)run
{
    
}
- (void)richTextView:(TQRichTextView *)view touchEndRun:(TQRichTextRun *)run
{
    if ([run isKindOfClass:[TQRichTextRunURL class]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:run.text]];
    }
    
    NSLog(@"%@",run.text);
}























@end
