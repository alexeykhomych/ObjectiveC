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

- (void)performWorkInBackgroundWithObject:(id)object;
- (void)performProcessQueueObjects;

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
        [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:) withObject:object];
        
//        [self finishProcessingObject:object];
//        [self finishProcessing];
    }
}

- (void)receiveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money += money;
        NSLog(@"%@ забрал бабло", self);
    }
}

- (void)giveMoney:(NSUInteger)money {
    @synchronized (self) {
        self.money -= money;
        NSLog(@"%@ отдал бабло", self);
    }
}

- (void)takeMoneyFromObject:(id<AKIMoney>)object {
    @synchronized (self) {
        NSUInteger money = object.money;
        [object giveMoney:money];
        NSLog(@"%@ отдал бабло %@", object, self);
        [self receiveMoney:money];
        NSLog(@"%@ получил бабло %@", object, self);
    }
}

- (void)finishProcessing {
    self.state = AKIWorkerPending;
}

- (void)performWorkWithObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)finishProcessingObject:(AKIWorker *)worker {
    worker.state = AKIWorkerFree;
}

- (void)addObjectToQueue:(id)object {
    [self.objectsQueue enqueueObject:object];
}

- (id)objectFromQueue {
    return [self.objectsQueue dequeueObject];
}

#pragma mark -
#pragma mark Private Methods

- (void)performWorkInBackgroundWithObject:(id)object {
    [self performWorkWithObject:object];
    [self performSelectorOnMainThread:@selector(finishProcessingObject:) withObject:object waitUntilDone:NO];
}

- (void)performProcessQueueObjects {
    id object = nil;
    
    @synchronized (self) {
        while ((object = [self.objectsQueue dequeueObject])) {
            [self processObject:object];
        }
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
