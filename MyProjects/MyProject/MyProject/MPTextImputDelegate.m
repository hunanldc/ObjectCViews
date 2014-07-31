//
//  MPTextImputDelegate.m
//  MyProject
//
//  Created by hunanldc on 14-7-31.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPTextImputDelegate.h"
#import "MPTextFiled.h"
#import "MPTextView.h"

@implementation MPTextImputDelegate

#pragma mark -- textfiled and textview 共用
- (BOOL)textField:(MPTextFiled *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
    
    return newLength <= textField.maxLength || returnKey;
    return YES;
    
}

#pragma mark -- textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChange:(MPTextFiled *)textField
{
    UITextRange *markRange = textField.markedTextRange;
    int pos = [textField offsetFromPosition:markRange.start
                                toPosition:markRange.end];
    int nLength = textField.text.length - pos;

    if (nLength > textField.maxLength && pos == 0) {
        textField.text = [textField.text substringToIndex:textField.maxLength];
    }
    NSLog(@"%@/%@",@(nLength),@(textField.maxLength));
}


#pragma mark -- textview
- (void)textViewDidChange:(MPTextView *)textView
{
    UITextRange *markRange = textView.markedTextRange;
    int pos = [textView offsetFromPosition:markRange.start
                                toPosition:markRange.end];
    int nLength = textView.text.length - pos;
    if (nLength > textView.maxLength && pos==0) {
        textView.text = [textView.text substringToIndex:textView.maxLength];
    }
}


@end
