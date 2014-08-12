//
//  MPGCDTest.m
//  MyProject
//
//  Created by hunanldc on 14-8-12.
//  Copyright (c) 2014年 hunanldc. All rights reserved.
//

#import "MPGCDTest.h"

static dispatch_queue_t serialQueue;
static dispatch_queue_t concurrentQueue;

@implementation MPGCDTest

- (dispatch_queue_t)newSerialDispatchQueue
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        //串行队列，每个串行队列对应一个系统线程，队列中的线程串行执行，每次只执行一个，先进先出顺序
        serialQueue = dispatch_queue_create("my Serial queue name", NULL);
    });
    return serialQueue;
}

- (dispatch_queue_t)newConcurrentDispatchQueue
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        //并行队列，队列实际线程数由系统内核决定，队列中的线程并行执行
        concurrentQueue = dispatch_queue_create("my Concurrent queue name", DISPATCH_QUEUE_CONCURRENT);
    });
    return concurrentQueue;
}

- (void)addNewSerialThread
{
    dispatch_async([self newSerialDispatchQueue], ^{
        NSLog(@"helloworld");
    });
}

- (void)addNewConcurrentThread
{
    dispatch_async([self newConcurrentDispatchQueue], ^{
        NSLog(@"helloworld");
    });
}

- (void)dealloc
{
//    dispatch_release([self newConcurrentDispatchQueue]);
//    dispatch_release([self newSerialDispatchQueue]);
}

@end
