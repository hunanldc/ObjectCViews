//
//  MPViewController.m
//  MyProject
//
//  Created by hunanldc on 14-7-29.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPViewController.h"
#import "MPUITest.h"
#import "MPTextImputDelegate.h"
#import "MPTextView.h"

@interface MPViewController () <UITextFieldDelegate>

@property (nonatomic, strong)MPTextFiled *text;
@property (nonatomic, strong)MPTextImputDelegate *inputDelegate;

@end

@implementation MPViewController

- (void)viewDidLoad
{
    self.inputDelegate = [[MPTextImputDelegate alloc] init];
    [self addMPTextField];
    
    [self addMPTextView];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)addMPTextView
{
    MPTextView *textview = [[MPTextView alloc] init];
    textview.maxLength = 5;
    textview.frame = CGRectMake(120, 20.f, 100, 60.f);
    textview.backgroundColor = [UIColor grayColor];
    textview.delegate = self.inputDelegate;
    [self.view addSubview:textview];
}

- (void)addMPTextField
{
    self.text = [MPUITest testMPTextFiled];
    self.text.delegate = self.inputDelegate;
    
    [self.text addTarget:self.inputDelegate action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:self.text];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
