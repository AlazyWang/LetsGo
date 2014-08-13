//
//  LGTextView.m
//  LetsGo
//
//  Created by robert on 14-8-10.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "LGTextView.h"

@interface LGTextView ()
@property (nonatomic,assign)BOOL isHiddenPlacehoder;
@end

@implementation LGTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _placeholderColor = [UIColor grayColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textHasChange) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void)textHasChange
{
    NSLog(@"----%d",self.text.length);
    if (self.text.length) {
        _isHiddenPlacehoder = YES;
        [self setNeedsDisplay];
    } else{
        _isHiddenPlacehoder = NO;
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    if (_isHiddenPlacehoder)return;
    
    [_placeholderColor set];
    CGFloat paddingX= 8;
    CGFloat paddingY= self.font.lineHeight * 0.25;
    
    rect.origin.x = paddingX;
    rect.origin.y = paddingY;
    rect.size.height -= 2 * paddingY;
    rect.size.width -= 2 *paddingX;
    [_placeholder drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByWordWrapping];
    
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    [self setNeedsDisplay];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    [self setNeedsDisplay];
}

@end
