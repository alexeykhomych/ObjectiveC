//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "NSObject+AKICategory.h"
#import "AKIWorker.h"

@protocol AKIMoney <NSObject>

- (void)giveMoneyToWorker:(AKIWorker *)worker;
- (void)setWorkPlace:(AKIBuilding *)workPlace;

@end

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self.free = YES;
    [super dealloc];
}

+ (instancetype)worker {
    AKIWorker *worker = [[self new] autorelease];
    worker.workPlace = [AKIBuilding object];
    worker.free = YES;
    return worker;
}

#pragma mark -
#pragma mark Public Implementations

- (void)work {
    NSLog(@"super work");
}

- (void)takeMoney:(NSInteger)money {
    
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    
}

- (void)doJob {
    
}

- (void)setWorkPlace:(AKIBuilding *)workPlace {
    
}

@end
