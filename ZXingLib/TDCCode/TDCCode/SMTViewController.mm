//
//  SMTViewController.m
//  TDCCode
//
//  Created by hunanldc on 13-7-11.
//  Copyright (c) 2013年 hunanldc. All rights reserved.
//

#import "SMTViewController.h"
#import <zxing/ZXingWidgetController.h>
#import <zxing/QRCodeReader.h>
#import <zxing/DataMatrixReader.h>
#import <zxing/MultiFormatOneDReader.h>
#import <zxing/MultiFormatUPCEANReader.h>

//#import <ZXing/Classes/ZXingWidgetController.h>
//#import <ZXing/zxing/qrcode/QRCodeReader.h>
//#import <ZXing/zxing/datamatrix/DataMatrixReader.h>
//#import <ZXing/zxing/MultiFormatReader.h>
//#import "MultiFormatUPCEANReader.h"
//#import "MultiFormatOneDReader.h"


@interface SMTViewController ()<ZXingDelegate>

@end

@implementation SMTViewController

- (void)viewDidLoad
{
    UIButton *button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    button.frame = CGRectMake(0, 0, 100, 40);
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(btPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btPressed:(id)sender
{
    ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:self showCancel:YES OneDMode:NO showLicense:NO];
    QRCodeReader* qrcodeReader = [[QRCodeReader alloc] init];
    DataMatrixReader *dataMatrixReader = [[DataMatrixReader alloc] init];
    MultiFormatUPCEANReader *upceanReader = [[MultiFormatUPCEANReader alloc] init];
    MultiFormatOneDReader   *oneReader = [[MultiFormatOneDReader alloc] init];
    NSMutableSet *readers = [[NSMutableSet alloc ] initWithObjects:qrcodeReader,nil];
    [readers addObject:dataMatrixReader];
    [readers addObject:upceanReader];
    [readers addObject:oneReader];
    
    [oneReader release];
    [upceanReader release];
    [dataMatrixReader release];
    [qrcodeReader release];
    widController.readers = readers;
    [readers release];
    [self presentViewController:widController animated:YES completion:nil];
//    NSBundle *mainBundle = [NSBundle mainBundle];
//    widController.soundToPlay =
//    [NSURL fileURLWithPath:[mainBundle pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
}

- (void)zxingController:(ZXingWidgetController*)controller didScanResult:(NSString *)result
{
    NSLog(@"%@",result);
    [controller.navigationController popViewControllerAnimated:YES];
}

- (void)zxingControllerDidCancel:(ZXingWidgetController*)controller
{
    [controller.navigationController  popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
