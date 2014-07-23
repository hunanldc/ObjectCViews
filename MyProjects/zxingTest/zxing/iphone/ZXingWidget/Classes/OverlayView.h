/**
 * Copyright 2009 Jeff Verkoeyen
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <UIKit/UIKit.h>

@protocol CancelDelegate;

@interface OverlayView : UIView {
	NSMutableArray *_points;
	UIButton *cancelButton;
  UILabel *instructionsLabel;
	id<CancelDelegate> delegate;
	BOOL oneDMode;
  BOOL cancelEnabled;
  CGRect cropRect;
  NSString *displayedMessage;
  NSString *cancelButtonTitle;
}

@property (nonatomic, retain) NSMutableArray*  points;
@property (nonatomic, assign) id<CancelDelegate> delegate;
@property (nonatomic, assign) BOOL oneDMode;
@property (nonatomic, assign) CGRect cropRect;
@property (nonatomic, copy) NSString *displayedMessage;
@property (nonatomic, retain) NSString *cancelButtonTitle;
@property (nonatomic, assign) BOOL cancelEnabled;

@property (nonatomic, retain) UIColor *coverColor;  //遮挡颜色
@property (nonatomic, retain) UIColor *cornerColor; //角标颜色
@property (nonatomic, assign) CGFloat cornerWidth;  //角标宽度
@property (nonatomic, assign) CGFloat cornerLength; //角标长度
@property (nonatomic, assign) CGFloat cornerMargin; //角标与cropRect边距

- (id)initWithFrame:(CGRect)theFrame cancelEnabled:(BOOL)isCancelEnabled oneDMode:(BOOL)isOneDModeEnabled showLicense:(BOOL)shouldShowLicense;
- (id)initWithFrame:(CGRect)theFrame cancelEnabled:(BOOL)isCancelEnabled oneDMode:(BOOL)isOneDModeEnabled;

- (void)setPoint:(CGPoint)point;

@end

@protocol CancelDelegate
- (void)cancelled;
@end