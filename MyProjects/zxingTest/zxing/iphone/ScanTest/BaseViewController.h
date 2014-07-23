//
//  BaseViewController.h
//  DCalendar
//
//  Created by GaoAng on 14-5-6.
//  Copyright (c) 2014年 richinfo.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <math.h>
#import "MLNavigationController.h"
#import "DTextField.h"
#import "../../customControl/DCountButton.h"
#import "../../NetWork/DRequestOperatorManager.h"
#import "../../AccountManager/DAccountManager.h"
#import "../../customControl/DPopoverView.h"
#import "../../NetWork/DRequestOperatorManager.h"
#import "../../customControl/MBProgressHUD.h"
@interface BaseViewController : UIViewController<DRequestOperatorManagerDelegate>
@property (nonatomic, assign) BOOL showNetWorkingAnimated;

-(void)addGestureRecognizerToView;
-(void)removeGestureRecognizerFromView;
-(void)setPanDragType:(EDragType)dragType;


-(void)setBackBtnWithNormal:(NSString *)normal withSelect:(NSString *)select;
-(void)setTitle:(NSString *)title;
-(void)setTitle:(NSString *)title font:(UIFont*)font;
-(void)setTitle:(NSString *)title font:(UIFont*)font color:(UIColor*)color;

-(void)requestWithBaseReq:(DBaseRequest *)baseReq;
-(void)uploadImageWithBaseReq:(DBaseRequest *)baseReq;
-(void)backAction:(UIButton*)sender;



- (void)pushToViewControllerCustom:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popViewControllerAnimated:(BOOL)animated;

-(void)setAnimateText:(NSString*)text;
@end
