//
//  CXViewController.m
//  zxingTest
//
//  Created by hunanldc on 14-7-18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "CXViewController.h"
#import <ZXingWidgetController.h>
#import <QRCodeReader.h>
#import <OverlayView.h>

@interface CXViewController () <ZXingDelegate>

@end

@implementation CXViewController

- (void)viewDidLoad
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 80)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(scanPressed:) forControlEvents:UIControlEventTouchUpInside];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanPressed:(id)sender {
   ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:NO  OneDMode:NO showLicense:NO];
    widController.overlayView.cropRect = CGRectMake(100, 100, 200, 200);

    NSMutableSet *readers = [[NSMutableSet alloc ] init];
   QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
   [readers addObject:qrcodeReader];
   widController.readers = readers;
   [self presentViewController:widController animated:YES completion:nil];
}

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result
{
    NSLog(@"%@",result);
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller
{
    
}

@end
