//
//  LGSearch.m
//  LetsGo
//
//  Created by robert on 14-8-1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGSearch.h"

@implementation LGSearch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizeWithName:@"searchbar_textfield_background"];
        UIImageView *leftImage =[[UIImageView alloc]initWithImage:[UIImage imageWithNamed:@"searchbar_searchlist_search_icon"]];
        self.leftView= leftImage;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.placeholder = @"请输入";
        self.font = [UIFont systemFontOfSize:15.0f];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return self;
}

@end
