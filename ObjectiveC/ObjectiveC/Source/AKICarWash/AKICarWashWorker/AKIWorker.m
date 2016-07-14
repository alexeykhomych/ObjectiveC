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

@interface AKIWorker()
@property (nonatomic, assign) NSUInteger money;

- (void)performWorkInBackgroundWithObject:(id)object;
- (void)finishProcessingOnMainQueueWithObject:(id)object;

@end

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    self.objectsQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    self.salary = arc4random_uniform(100);
    self.experience = arc4random_uniform(10);
    self.state = AKIWorkerFree;
    self.objectsQueue = [AKIQueue object];
    
    return self;
}

#pragma mark -
#pragma mark Public methods

//не рабочий
- (void)processObject:(id)object {
    @synchronized (self) {
        if (self.state == AKIWorkerFree) {
            self.state = AKIWorkerBusy;
            [self performSelectorInBackground:@selector(performWorkInBackgroundWithObject:) withObject:object];
        } else {
            [self.objectsQueue enqueueObject:object];
        }
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
        [self receiveMoney:money];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)performWorkInBackgroundWithObject:(id)object {
    [self performWorkWithObject:object];
    [self performSelectorOnMainThread:@selector(finishProcessingOnMainQueueWithObject:) withObject:object waitUntilDone:NO];
    [self finishProcessingOnMainQueueWithObject:object];
}

- (void)performWorkWithObject:(id)object {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)finishProcessingObject:(AKIWorker *)worker {
    @synchronized (worker) {
        worker.state = AKIWorkerFree;
        NSLog(@"%@ change state on Free", self);
    }
}

- (void)finishProcessing {
    @synchronized (self) {
        self.state = AKIWorkerPending;
        NSLog(@"%@ change state on Pending", self);
    }
}

- (void)finishProcessingOnMainQueueWithObject:(id)object {
    @synchronized (self) {
        if (self.objectsQueue.count) {
            [self performWorkInBackgroundWithObject:object];
        } else {
            [self finishProcessing];
        }
    }
}

- (void)workerDidFinishProccesingObject:(AKIWorker *)worker {
    @synchronized (self) {
        [self processObject:worker];
    }
}

#pragma mark -
#pragma mark Overload Methods

- (SEL)selectorForState:(NSUInteger)state {
    @synchronized (self) {
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
}

#pragma mark -
#pragma mark AKIWorkerDelegate

- (void)workerDidBecomePending:(id)worker {
    @synchronized (self) {
        [self workerDidFinishProccesingObject:worker];
    }
}

@end
