//
//  LGPhotoView.m
//  LetsGo
//
//  Created by robert on 14-8-8.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGPhotoView.h"
#import "LGPhoto.h"

#import "UIImageView+WebCache.h"

@interface LGPhotoView ()

@property (nonatomic,strong) UIImageView *gifView;

@end

@implementation LGPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        _gifView = [[UIImageView alloc]initWithImage:[UIImage imageWithNamed:@"timeline_image_gif"]];
        
        CGRect gifFrame = _gifView.frame;
        
        gifFrame.origin.x = frame.size.width - gifFrame.size.width;
        gifFrame.origin.y = frame.size.height - gifFrame.size.height;
        
        _gifView.frame = gifFrame;
        
        _gifView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:_gifView];
 
    }
    return self;
}


- (void)setPhoto:(LGPhoto *)photo
{
    _photo = photo;
    
    [self setImageWithURL:[NSURL URLWithString:_photo.thumbnail_pic] placeholderImage:[UIImage imageWithNamed:@"timeline_image_loading"]];
    
    
    if ([photo.thumbnail_pic.lowercaseString hasSuffix:@"gif"]) {
        _gifView.hidden = NO;
    } else
    {
        _gifView.hidden = YES;
    }
}



@end
