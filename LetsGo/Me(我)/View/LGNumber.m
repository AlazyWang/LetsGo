//
//  LGNumber.m
//  LetsGo
//
//  Created by robert on 14-8-13.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGNumber.h"

@implementation LGNumber

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.titleLabel.numberOfLines = 0;
   
    }
    return self;
}

- (void)setNumber:(int)number title:(NSString *)title
{
    NSString *numberStr = [NSString stringWithFormat:@"%d",number];
    
    NSString *totalTitle = [NSString stringWithFormat:@"%@\n%@",numberStr,title];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:totalTitle];
    
    [attributeStr addAttribute:NSForegroundColorAttributeName value:LGColor(48, 83, 143) range:NSMakeRange(0, numberStr.length)];
    
    [self setAttributedTitle:attributeStr forState:UIControlStateNormal];
}




@end
