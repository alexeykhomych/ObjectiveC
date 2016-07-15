//
//  AKICarWash.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWash.h"

#import "NSObject+AKIExtensions.h"
#import "NSArray+AKIExtensions.h"

#import "AKIWasher.h"
#import "AKIDirector.h"
#import "AKIAccountant.h"

#import "AKIQueue.h"

#import "AKIObservableObject.h"

static NSUInteger const kAKIMaxWasherCount = 5;

@interface AKICarWash()
@property (nonatomic, retain) NSMutableArray *washers;

@property (nonatomic, retain) AKIQueue      *carQueue;
@property (nonatomic, retain) AKIQueue      *washerQueue;
@property (nonatomic, retain) AKIDirector   *director;
@property (nonatomic, retain) AKIAccountant *accountant;

- (void)addCarToQueue:(AKICar *)car;

- (id)reservedWasher;
- (NSArray *)freeWorkersWithClass:(Class)cls;
- (void)removeWorkerObservers:(id)worker;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.washers = nil;
    self.carQueue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];

    self.carQueue = [AKIQueue object];
    self.washers = [NSMutableArray array];
    self.washerQueue = [AKIQueue object];

    [self initCarWash];
    
    return self;
}

- (void)initCarWash {
    AKIAccountant *accountant = [AKIAccountant object];
    AKIDirector *director = [AKIDirector object];
    
    [accountant addObserver:director];
    NSArray *observers = @[accountant, self];
    
    //array
    id washers = self.washers;
    
    for (NSUInteger i = 0; i < kAKIMaxWasherCount; i++) {
        AKIWasher *washer = [AKIWasher object];
        [washers addObject:washer];
        [washer addObservers:observers];
    }

    self.director = director;
    self.accountant = accountant;
}

#pragma mark -
#pragma mark Public Methods

- (void)addCarToQueue:(AKICar *)car {
//    передумать
//    AKIAccountant *accountant = self.accountant;
//    
//    @synchronized (accountant) {
//        if (accountant.objectsQueue.count) {
//            [accountant processObjects];
//        }
//    }
    
    [self.carQueue enqueueObject:car];
    [self washCar];
}

#pragma mark -
#pragma mark Private Methods

- (void)washCar{
    @synchronized (self) {
        AKIWasher *washer = [self reservedWasher];
        AKICar *car = [self.carQueue dequeueObject];
        
        if (washer) {
            [washer processObject:car];
        } else {
            [self.carQueue enqueueObject:car];
        }
    }
}

- (id)reservedWasher {
    @synchronized (self) {
        return [self reservedFreeWorkerWithClass:[AKIWasher class]];
    }
}

- (id)reservedFreeWorkerWithClass:(Class)cls {
    @synchronized (self) {
        return [[self freeWorkersWithClass:cls] firstObject];
    }
}

- (NSArray *)freeWorkersWithClass:(Class)cls {
    @synchronized (self) {
        return [self.washers filterWithBlock:^BOOL(AKIWorker *worker) { return worker.state != AKIWorkerBusy; }];
    }
}

- (void)removeWorkerObservers:(id)worker {
    AKIAccountant *accountant = self.accountant;
    [accountant removeObserver:self.director];
    
    NSArray *observers = @[accountant, self];
    
    for (AKIWasher *washer in self.washers) {
        [washer removeObservers:observers];
    }
}

#pragma mark -
#pragma mark Observer Protocol

- (void)workerDidBecomeFree:(id)worker {
    NSUInteger count = [self.carQueue objectsCount];
    
    if (count) {
        [worker processObject:[self.carQueue dequeueObject]];
    }
}

@end
