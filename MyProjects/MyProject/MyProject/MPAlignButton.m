//
//  MPAlignButton.m
//  MyProject
//
//  Created by hunanldc on 14-7-29.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPAlignButton.h"

@implementation MPAlignButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (UIButton *)buttonWithRightImageSize:(CGSize)size btSize:(CGSize)btSize;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, btSize.width, btSize.height);
    
    CGSize imageSize = size;
    
    //设置图片位置
    {
        CGFloat rightMargin = 0.f;//图片与右边的边距
        CGFloat topMargin = btSize.height/2 - imageSize.height/2;
        CGFloat leftMargin = btSize.width - rightMargin - btSize.width;
        button.imageEdgeInsets = UIEdgeInsetsMake(topMargin, leftMargin, btSize.height - topMargin, rightMargin);
    }
    
//    //设置标题位置
//    {
//        CGFloat rightMargin =
//    }
    return button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
