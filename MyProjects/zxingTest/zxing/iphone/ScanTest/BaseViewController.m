//
//  BaseViewController.m
//  DCalendar
//
//  Created by GaoAng on 14-5-6.
//  Copyright (c) 2014年 richinfo.cn. All rights reserved.
//

#import "BaseViewController.h"
#import "MLNavigationController.h"
@interface BaseViewController (){
	MBProgressHUD *HUD;
	BOOL isShowingAnimated;
}
@end

@implementation BaseViewController
@synthesize showNetWorkingAnimated;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		[self setPanDragType:EDrag_right];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];

	showNetWorkingAnimated = YES;
	isShowingAnimated = NO;
	
	HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	[HUD hide:YES];
	HUD.labelText = @"正在获取数据...";
	
	if ([Utility isSystemVersionSeven]) {
		[[UINavigationBar appearance] setBarTintColor:MainTitleBgColor];
		
		//背景栏
		UILabel *bgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
		[bgLabel setBackgroundColor:MainTitleBgColor];
		[self.view addSubview:bgLabel];
	}

	
	UIButton  *returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [returnBtn setTag:100];
	[returnBtn setBackgroundColor:[UIColor clearColor]];
	[returnBtn setImage:[UIImage imageNamed:@"ic_return_nor.png"] forState:UIControlStateNormal];
	[returnBtn setImage:[UIImage imageNamed:@"ic_return_sel.png"] forState:UIControlStateHighlighted];
	[returnBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	[self.view setBackgroundColor:MainViewBgColor];
	[self.navigationController.navigationBar setHidden:NO];
	[self addGestureRecognizerToView];
}


-(void)addGestureRecognizerToView{
	MLNavigationController* nv = (MLNavigationController*)self.navigationController;
	[nv addGestureRecognizer];
}

-(void)removeGestureRecognizerFromView{
	MLNavigationController *nv = (MLNavigationController*)self.navigationController;
	[nv releaseGestureRecognizer];
}


#pragma mark -FSDF
-(void)setBackBtnWithNormal:(NSString *)normal withSelect:(NSString *)select{
    UIButton  *returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
	[returnBtn setBackgroundColor:[UIColor clearColor]];
	[returnBtn setBackgroundImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
	[returnBtn setBackgroundImage:[UIImage imageNamed:select] forState:UIControlStateHighlighted];
	[returnBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
}
#pragma mark -
-(void)setPanDragType:(EDragType)dragType{
	if (dragType >= EDrag_No && dragType <= EDrag_All) {
		MLNavigationController* nav = (MLNavigationController*)self.navigationController;
		[nav setDragType:dragType];
	}
}
- (void )pushToViewControllerCustom:(UIViewController *)viewController animated:(BOOL)animated{
	if (viewController) {
		[self.navigationController pushViewController:viewController animated:animated];
	}
}

-(void)popViewControllerAnimated:(BOOL)animated{
	[self.navigationController popViewControllerAnimated:animated];
}

#pragma mark -
-(void)setTitle:(NSString *)title{
	[self setTitle:title font:[UIFont systemFontOfSize:20.9f]];
}

-(void)setTitle:(NSString *)title font:(UIFont*)font{
	[self setTitle:title font:font color:[UIColor whiteColor]];
}

-(void)setTitle:(NSString *)title font:(UIFont*)font color:(UIColor*)color{
	if (font == nil) {
		font = [UIFont systemFontOfSize:20];
	}
	if (color == nil) {
		color = [UIColor whiteColor];
	}
	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width/4, 44)];
    titleLabel.font = font;
    titleLabel.textColor = color;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    self.navigationItem.titleView = titleLabel;
}

-(void)backAction:(UIButton*)sender{
	[self.navigationController popViewControllerAnimated:YES];
}

-(void)setAnimateText:(NSString*)text{
	if (HUD) {
       HUD.labelText=text;
		HUD.alpha = 0.5f;
	}
}
#pragma mark - 

- (void)requestWithBaseReq:(DBaseRequest *)baseReq {
	
	if (showNetWorkingAnimated && !isShowingAnimated) {
		[HUD show:YES];
		[self.view bringSubviewToFront:HUD];
	}

	[[DRequestOperatorManager connection] startRequest:baseReq delegate:self];
}

- (void)uploadImageWithBaseReq:(DBaseRequest *)baseReq{
	[[DRequestOperatorManager connection] startRequest:baseReq delegate:self];
}


-(void)URLDataReceiverDidFinish:(DBaseResponsed *)receiverData{
	[HUD hide:YES];
	isShowingAnimated = NO;
	//code == 3 :待同步活动数量为0
	if (receiverData && (receiverData.code != 0  && receiverData.code != 3)) {
		[Utility showMessage:receiverData.summary];
	}
	else if (receiverData && receiverData.errorCode == -1001){
		[Utility showMessage:@"网络超时，请检查网络连接"];
	}
}


@end
