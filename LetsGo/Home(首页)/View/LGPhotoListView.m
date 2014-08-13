//
//  LGPhotoListView.m
//  LetsGo
//
//  Created by robert on 14-8-7.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGPhotoListView.h"
#import "LGPhoto.h"
#import "UIImageView+WebCache.h"

#import "MJExtension.h"
#import "LGPhotoView.h"

#define LGPhotoMaxCount 9
#define LGPhotoWH 85
#define LGPhotoMargin 8

@implementation LGPhotoListView




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        for (int i = 0; i < LGPhotoMaxCount; i++) {
            LGPhotoView *photoView = [[LGPhotoView alloc]init];
            [self addSubview:photoView];
        }
    }
    return self;
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;
    
    NSUInteger picCount = pic_urls.count;
    
    for (int i = 0; i < LGPhotoMaxCount; i++) {
        LGPhotoView *imageView = self.subviews[i];
        
        if (i < picCount) {
            imageView.hidden = NO;
            
            if (picCount == 1) {
                imageView.contentMode = UIViewContentModeScaleAspectFit;
                imageView.clipsToBounds = NO;
            } else{
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = YES;
            }
            
            int colTotalCount = pic_urls.count == 4?2:3;
            
            int col = i % colTotalCount;
            int row = i / colTotalCount;
            
            CGFloat imageX = col * (LGPhotoWH+LGPhotoMargin);
            
            
            CGFloat imageY = row * (LGPhotoWH+LGPhotoMargin);
            
            imageView.frame = CGRectMake(imageX, imageY, LGPhotoWH, LGPhotoWH);
            
            imageView.photo = pic_urls[i];
//
//            LGPhoto *photo = pic_urls[i];
//            
//            [imageView setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"timeline_image_loading"]];
            
            
        } else
        {
            imageView.hidden = YES;
        }
    }
    
}


+ (CGSize)photoListSizeWithCount:(int)count
{
    int macColPerRow = count==4?2:3;
    
    int colCount = count >=macColPerRow ?macColPerRow:count;
    
    int rowCount = (count - 1)/macColPerRow + 1;
    
    CGFloat photoListW =colCount *LGPhotoWH + (colCount - 1)*LGPhotoMargin;
    CGFloat photoListH= rowCount *LGPhotoWH + (rowCount - 1)*LGPhotoMargin;
    return CGSizeMake(photoListW, photoListH);
    

}

@end
