//
//  MPUniversal.h
//  MyProject
//
//  Created by hunanldc on 14-7-29.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ColorWithString(string) [MPUniversal colorWithString:string]

@interface MPUniversal : NSObject

+ (UIColor *)colorWithString:(NSString *)string;

@end
