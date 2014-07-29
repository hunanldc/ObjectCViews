//
//  MPUniversalTest.m
//  MyProject
//
//  Created by hunanldc on 14-7-29.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MPUniversal.h"

@interface MPUniversalTest : XCTestCase

@end

@implementation MPUniversalTest

- (void)setUp
{
    NSLog(@"MPUniversalTest setUp");
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    NSLog(@"MPUniversalTest tearDown");
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSLog(@"MPUniversalTest testExample");
    NSLog(@"%@",[MPUniversal colorWithString:@"ff"]);

    NSLog(@"%@",[MPUniversal colorWithString:@"ffffa0"]);
    NSLog(@"%@",[MPUniversal colorWithString:@"#ffffa0"]);
    NSLog(@"%@",[MPUniversal colorWithString:@"ffffffa0"]);
    NSLog(@"%@",[MPUniversal colorWithString:@"#ffffffa0"]);
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
