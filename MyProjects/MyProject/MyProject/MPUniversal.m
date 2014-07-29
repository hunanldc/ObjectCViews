//
//  MPUniversal.m
//  MyProject
//
//  Created by hunanldc on 14-7-29.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPUniversal.h"

@implementation MPUniversal


/**
 *  转换字符串为UIColor
 *
 *  @param string 字符串类型：ffffff六位,ffffffff八位,#ffffff,#ffffffff; 字符允许大小写交叉
 *
 *  @return uicolor 参数错误时，返回黑色
 */
+ (NSUInteger)valueWithCharacher:(char)c
{
    if (c >= 'a' && c <= 'f') return c - 'a' + 10;
    if (c >= 'A' && c <= 'F') return c - 'A' + 10;
    if (c >= '0' && c <= '9') return c - '0';
    return 0;
}

+ (UIColor *)colorWithString:(NSString *)string;
{
    if (![string isKindOfClass:[NSString class]]) {
        NSLog(@"MPUniversal col orWithString: 参数错误");
        return [UIColor blackColor];
    }
    CGFloat components[4] = {};
    components[3] = 1.0f;
    if ([string length] % 2 == 1) {
        //去#号
        string = [string substringFromIndex:1];
    }
    for (int i = 0; i < [string length]; i+=2) {
        components[i/2] = [self valueWithCharacher:[string characterAtIndex:i]] * 16 + [self valueWithCharacher:[string characterAtIndex:i+1]];
        components[i/2] = components[i/2]/255.f;
    }
    return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
}

#define DEFAULT_VOID_COLOR [UIColor clearColor]

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    //去掉两端的空格
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
