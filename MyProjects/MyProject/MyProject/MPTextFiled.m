//
//  MPTextFiled.m
//  MyProject
//
//  Created by hunanldc on 14-7-30.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPTextFiled.h"

@interface MPTextFiled () <UITextFieldDelegate>

@end

@implementation MPTextFiled
@synthesize maxLength = _maxLength;

+ (MPTextFiled *)testText
{
    MPTextFiled *text = [[self alloc] initWithFrame:CGRectMake(0, 0, 100, 30.f)];
    text.maxLength = 5.f;
    text.placeholder = @"限制最大长度为5";
    return text;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.maxLength = NSUIntegerMax;
    }
    return self;
}


// - (BOOL)textField:(MPTextFiled *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
// {
//    if (self.maxLength == NSUIntegerMax) return YES;
//
//    if (string.length > 1) {
//        //粘贴
//        NSMutableString *text = [NSMutableString string];
//        if (textField.text) [text appendString:textField.text];
//        text = (NSMutableString *)[text stringByReplacingCharactersInRange:range withString:string];
//        if ([text length] > self.maxLength) {
//            self.text = [text substringToIndex:self.maxLength];
//            return NO;
//        }
//    }else if ([string length] != 0/*string为空时是删除*/  &&
//              (range.location >= self.maxLength || self.text.length >= self.maxLength)) {
//        //中文时还需处理
//        return NO;
//    }

//    if (string.length == 0) return YES;
//
//    NSInteger existedLength = textField.text.length;
//    NSInteger selectedLength = range.length;
//    NSInteger replaceLength = string.length;
//    if (existedLength - selectedLength + replaceLength > textField.maxLength) {
//        return NO;
//    }
//    return YES;

//    NSLog(@"%@ %d,%d,%@",string,range.location,range.length,textField.selectedTextRange);
//NSUInteger oldLength = [textField.text length];
//NSUInteger replacementLength = [string length];
//NSUInteger rangeLength = range.length;
//
//NSUInteger newLength = oldLength - rangeLength + replacementLength;
//
//BOOL returnKey = [string rangeOfString: @"\n"].location != NSNotFound;
//
//return newLength <= textField.maxLength || returnKey;
//return YES;

//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [textField resignFirstResponder];
//    return YES;
//}

//- (void)textFieldDidEndEditing:(MPTextFiled *)textField
//{
//    if ([textField.text length] > textField.maxLength) {
//        textField.text = [textField.text substringToIndex:textField.maxLength];
//    }
//}

//- (void)textFieldDidChange:(MPTextFiled *)textField
//{
//    NSLog(@"%@",textField.text);
//    if (textField.text.length > textField.maxLength) {
//        textField.text = [textField.text substringToIndex:textField.maxLength];
//        NSLog(@"%@",textField.text);
//    }
//    
//    NSUInteger kMaxLength = textField.maxLength;
//    NSString *toBeString = textField.text;
//    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
//    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
//        UITextRange *selectedRange = [textField markedTextRange];
//        //获取高亮部分
//        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
//        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
//        if (!position) {
//            if (toBeString.length > kMaxLength) {
//                textField.text = [toBeString substringToIndex:kMaxLength];
//            }
//        }
//        // 有高亮选择的字符串，则暂不对文字进行统计和限制
//        else{
//
//        }
//    }
//    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
//    else{
//        if (toBeString.length > kMaxLength) {
//            textField.text = [toBeString substringToIndex:kMaxLength];
//        }
//    }
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    NSInteger length= textField.text.length;
//    if(length>3)
//    {
//        NSString *memo = [textField.text substringWithRange:NSMakeRange(0, 3)];
//        nameField.text=memo;
//    }
//}
//
//这样，当用户输入完，无论联想了多少，都只取前3个字.
//
//那么就只剩第一个问题了   ：怎么才能只输入中文？

@end
