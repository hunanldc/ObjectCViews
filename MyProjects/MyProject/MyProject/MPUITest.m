//
//  MPUITest.m
//  MyProject
//
//  Created by hunanldc on 14-7-30.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPUITest.h"

@implementation MPUITest

+ (MPTextFiled *)testMPTextFiled
{
    MPTextFiled *text = [[MPTextFiled alloc] initWithFrame:CGRectMake(0, 20.f, 100, 30)];
    text.maxLength = 5;
    text.placeholder = @"限制输入5个字符";
    return text;
}

@end
