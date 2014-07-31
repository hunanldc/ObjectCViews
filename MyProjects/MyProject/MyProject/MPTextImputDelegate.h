//
//  MPTextImputDelegate.h
//  MyProject
//
//  Created by hunanldc on 14-7-31.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MPTextFiled;

@interface MPTextImputDelegate : NSObject <UITextFieldDelegate, UITextViewDelegate>

- (void)textFieldDidChange:(MPTextFiled *)textField;

@end
