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
#import "SingletonWorkers.h"

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
    worker.free = YES;
    
    SingletonWorkers *sworkers = [SingletonWorkers sharedInstance];
    
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    [dictionary setObject:worker forKey:worker.className];
    [sworkers.workers addObject:dictionary];
    
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
