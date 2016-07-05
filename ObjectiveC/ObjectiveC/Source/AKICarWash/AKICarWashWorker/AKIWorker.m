//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "NSObject+AKIExtensions.h"
#import "AKIWorker.h"

#import "AKIWorkerDelegate.h"

@interface AKIWorker()
@property (nonatomic, assign) NSUInteger money;

@end

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (instancetype)init {
    self = [super init];
    
    self.salary = arc4random_uniform(100);
    self.experience = arc4random_uniform(10);
    self.state = AKIWorkerFree;
    
    return self;
}

#pragma mark -
#pragma mark Public methods

- (void)processObject:(id)object {
    self.state = AKIWorkerBusy;
    [self performWorkWithObject:object];
    self.state = AKIWorkerPending;
    [self finishProcessing];
}

- (void)receiveMoney:(NSUInteger)money {
    self.money += money;
}

- (void)giveMoney:(NSUInteger)money {
    self.money -= money;
}

- (void)takeMoneyFromObject:(id<AKIMoney>)object {
    NSUInteger money = object.money;
    [object giveMoney:money];
    [self receiveMoney:money];
}

- (void)finishProcessing {
    self.state = AKIWorkerFree;
}

- (void)performWorkWithObject:(id)object {
    
}

#pragma mark -
#pragma mark Overload Methods

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case AKIWorkerBusy:
            return @selector(workerDidBecomeBusy:);
            
        case AKIWorkerPending:
            return @selector(workerDidBecomePending:);

        case AKIWorkerFree:
            return @selector(workerDidBecomeFree:);
        
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark AKIWorkerDelegate

- (void)workerDidFinishProccesingObject:(AKIWorker *)worker {
    [self processObject:worker];
}

@end
