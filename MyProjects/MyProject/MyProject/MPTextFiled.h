//
//  MPTextFiled.h
//  MyProject
//
//  Created by hunanldc on 14-7-30.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPTextFiled : UITextField

@property (nonatomic, assign)NSUInteger maxLength;

@property (nonatomic, assign)BOOL calculateWithBytes;

+ (MPTextFiled *)testText;

@end
