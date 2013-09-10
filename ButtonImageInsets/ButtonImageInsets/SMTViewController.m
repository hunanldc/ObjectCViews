//
//  SMTViewController.m
//  ButtonImageInsets
//
//  Created by hunanldc on 13-9-10.
//  Copyright (c) 2013年 hunanldc. All rights reserved.
//

#import "SMTViewController.h"

@interface SMTViewController ()
{
    UIButton        *button_;
}

@end

@implementation SMTViewController

- (void)viewDidLoad
{
    button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 10, 200, 40);
    [self.view addSubview:button_];
    [button_ setImage:[UIImage imageNamed:@"icon_add"] forState:UIControlStateNormal];
    [button_ setTitle:@"image align right" forState:UIControlStateNormal];
    button_.titleLabel.backgroundColor = [UIColor redColor];
    button_.backgroundColor = [UIColor blackColor];
    
//    //image align right
//    button_.imageEdgeInsets = UIEdgeInsetsMake(0, button_.frame.size.width - 40, 0, 0);
//    button_.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 40);
    
//    //image align left
//    button_.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, button_.frame.size.width - 40);
    
//    //image align top
//    button_.frame = CGRectMake(100, 10, 200, 80);
//    button_.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 40, 80);
//    button_.titleEdgeInsets = UIEdgeInsetsMake(40, -40, 0, 0);
    
    //image align bottom
    button_.frame = CGRectMake(100, 10, 200, 80);
    button_.imageEdgeInsets = UIEdgeInsetsMake(40, 80, 0, 80);
    button_.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 40, 0);
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
