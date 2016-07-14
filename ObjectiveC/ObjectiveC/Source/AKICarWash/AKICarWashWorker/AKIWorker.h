//
//  AKIWorker.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIMoney.h"
#import "AKIObservableObject.h"
#import "AKIWorkerDelegate.h"
#import "AKIQueue.h"

@class AKIWorker;

typedef NS_ENUM(NSUInteger, AKIWorkerState) {
    AKIWorkerBusy,
    AKIWorkerPending,
    AKIWorkerFree
};

@protocol AKIMWorkerObserver <NSObject>

@optional
- (void)workerDidBecomeBusy:(id)worker;
- (void)workerDidBecomePending:(id)worker;
- (void)workerDidBecomeFree:(id)worker;

@end

@interface AKIWorker : AKIObservableObject <AKIMoney>
@property (nonatomic, assign) NSUInteger    salary;
@property (nonatomic, assign) NSUInteger    experience;
@property (nonatomic, retain) AKIQueue      *objectsQueue;

- (void)processObject:(id)object;
- (void)finishProcessing;
- (void)performWorkWithObject:(id)object;
- (void)finishProcessingObject:(id)object;

@end
