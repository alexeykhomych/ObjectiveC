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
    @synchronized (self) {
        self.state = AKIWorkerBusy;
        
        [self performWorkWithObject:object];
        [self finishProcessingObject:object];
        [self finishProcessing];
    }
}

- (void)receiveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
    }
}

- (void)giveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money -= money;
    }
}

- (void)takeMoneyFromObject:(id<AKIMoney>)object {
    @synchronized (self) {
        NSUInteger money = object.money;
        [object giveMoney:money];
        [self receiveMoney:money];
    }
}

- (void)finishProcessing {
    @synchronized (self) {
        self.state = AKIWorkerPending;
    }
}

- (void)performWorkWithObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)finishProcessingObject:(AKIWorker *)worker {
    @synchronized (self) {
        worker.state = AKIWorkerFree;
    }
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

- (void)workerDidBecomePending:(id)worker {
    @synchronized (self) {
        [self workerDidFinishProccesingObject:worker];
    }
}

- (void)workerDidFinishProccesingObject:(AKIWorker *)worker {
    @synchronized (self) {
        [self processObject:worker];
    }
}

@end
