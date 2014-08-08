//
//  LGStatusFrame.m
//  LetsGo
//
//  Created by robert on 14-8-6.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGStatusFrame.h"
#import "LGStatus.h"
#import "LGUser.h"
#import "LGPhotoListView.h"

#import "LGStatusDock.h"

@implementation LGStatusFrame

//头像
//@property (nonatomic, assign, readonly) CGRect iconViewF;
///** 昵称 */
//@property (nonatomic, assign, readonly) CGRect nameLabelF;
///** 时间 */
//@property (nonatomic, assign, readonly) CGRect timeLabelF;
///** 来源 */
//@property (nonatomic, assign, readonly) CGRect sourceLabelF;
///** 内容 */
//@property (nonatomic, assign, readonly) CGRect contentLabelF;
///** 配图 */
//@property (nonatomic, assign, readonly) CGRect photoListViewF;
///** 微博会员图标 */
//@property (nonatomic, assign, readonly) CGRect mbViewF;
//
///** 转发微博的整体 */
//@property (nonatomic, assign, readonly) CGRect retweetViewF;
///** 转发微博的昵称 */
//@property (nonatomic, assign, readonly) CGRect retweetNameLabelF;
///** 转发微博的配图 */
//@property (nonatomic, assign, readonly) CGRect retweetPhotoListViewF;
///** 转发微博的内容 */
//@property (nonatomic, assign, readonly) CGRect retweetContentLabelF;

//@property (nonatomic, assign, readonly) CGFloat cellHeight;

- (void)setStatus:(LGStatus *)status
{
    _status = status;
    
    LGUser *user = status.user;
    LGStatus *retweeted_status = status.retweeted_status;
    
    CGFloat cellWidth = [UIScreen mainScreen].applicationFrame.size.width - 2 * IWTableBorderWidth;
    

    
    CGFloat iconX = IWCellBorderWidth;
    CGFloat iconY = IWCellBorderWidth;
    _iconViewF = CGRectMake(iconX, iconY, 34, 34);
    
    CGFloat nameX = CGRectGetMaxX(_iconViewF) + IWCellBorderWidth;
    CGFloat nameY = IWCellBorderWidth;
    CGSize nameSize = [user.name sizeWithFont:IWNameFont];
    _nameLabelF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    CGFloat mbViewX = CGRectGetMaxX(_nameLabelF) + IWCellBorderWidth;
    CGFloat mbViewY = (CGRectGetHeight(_nameLabelF) - 14) * 0.5 + IWCellBorderWidth;
    _mbViewF = CGRectMake(mbViewX, mbViewY, 14, 14);
    
    CGFloat contentX = iconX;
    CGFloat contentY = CGRectGetMaxY(_iconViewF) + IWCellBorderWidth;
    CGSize contentSize = [status.text sizeWithFont:IWContentFont constrainedToSize:CGSizeMake(cellWidth - 2 *IWCellBorderWidth, MAXFLOAT)];
    _contentLabelF = CGRectMake(contentX, contentY, contentSize.width , contentSize.height);
    
    if (status.pic_urls.count) {
        CGFloat photoListX = contentX;
        CGFloat photoListY = CGRectGetMaxY(_contentLabelF) + IWCellBorderWidth;
        CGSize photoListSize = [LGPhotoListView photoListSizeWithCount:status.pic_urls.count];

        _photoListViewF = CGRectMake(photoListX, photoListY, photoListSize.width, photoListSize.height);
    } else if(retweeted_status)
    {
        CGFloat retweetX = contentX;
        CGFloat retweetY = CGRectGetMaxY(_contentLabelF) + IWCellBorderWidth;
        CGFloat retweetWidth = cellWidth - 2*IWCellBorderWidth;
        CGFloat reweetHeight = 0;
        
        
        CGFloat retweetNameX= IWCellBorderWidth;
        CGFloat retweetNameY= 2 *IWCellBorderWidth;
        CGSize retweetNameSize =  [[NSString stringWithFormat:@"@%@",retweeted_status.user.name] sizeWithFont:IWRetweetNameFont];
        _retweetNameLabelF = CGRectMake(retweetNameX, retweetNameY, retweetNameSize.width, retweetNameSize.height);
        
        CGFloat retweetContentX = retweetNameX;
        CGFloat retweetContentY = CGRectGetMaxY(_retweetNameLabelF) + IWCellBorderWidth;
        CGSize retweetContentSize = [retweeted_status.text sizeWithFont:IWRetweetNameFont constrainedToSize:CGSizeMake(retweetWidth - 2 *IWCellBorderWidth , MAXFLOAT)];
        _retweetContentLabelF = CGRectMake(retweetContentX, retweetContentY, retweetContentSize.width, retweetContentSize.height);
        
        if (retweeted_status.pic_urls.count) {
            CGFloat retweetPhotoListX = retweetContentX;
            CGFloat retweetPhotoListY = CGRectGetMaxY(_retweetContentLabelF) + IWCellBorderWidth;
            
            CGSize retweetPhotoListSize = [LGPhotoListView photoListSizeWithCount:retweeted_status.pic_urls.count];
            _retweetPhotoListViewF = CGRectMake(retweetPhotoListX, retweetPhotoListY, retweetPhotoListSize.width, retweetPhotoListSize.height);
            reweetHeight = CGRectGetMaxY(_retweetPhotoListViewF);
            
        } else
        {
            reweetHeight = CGRectGetMaxY(_retweetContentLabelF);
        }
        
        reweetHeight += IWCellBorderWidth;
        _retweetViewF = CGRectMake(retweetX, retweetY, retweetWidth, reweetHeight);
        
    }
    
    if (retweeted_status) {
        _cellHeight = CGRectGetMaxY(_retweetViewF);
    } else if (status.pic_urls.count)
    {
        _cellHeight = CGRectGetMaxY(_photoListViewF);
    } else
    {
        _cellHeight = CGRectGetMaxY(_contentLabelF);
    }
    
    
    
    _cellHeight += IWCellBorderWidth + IWCellMargin + LGdockHight;
    
    
}


@end
