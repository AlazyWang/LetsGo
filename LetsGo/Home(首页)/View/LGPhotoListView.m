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
#import "MJPhoto.h"
#import "MJPhotoBrowser.h"

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
            photoView.userInteractionEnabled = YES;
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
            
            imageView.tag = i;
            
            
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)]];
            
        } else
        {
            imageView.hidden = YES;
        }
    }
    
}

- (void)tapImage:(UITapGestureRecognizer *)tap
{
    int count = _pic_urls.count;
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i ++) {
        NSString *url = [[(LGPhoto *)_pic_urls[i] thumbnail_pic] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        MJPhoto *photo = [[MJPhoto alloc]init];
        
        photo.url = [NSURL URLWithString:url];
        
        photo.srcImageView = (UIImageView *)tap.view;
        [photos addObject:photo];
    }
    
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc]init];
    browser.currentPhotoIndex = tap.view.tag;
    browser.photos = photos;
    [browser show];
    
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
