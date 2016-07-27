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

#import "AKIDispatcher.h"

static NSUInteger const kAKIWasherCount = 5;
static NSUInteger const kAKIAccoutantCount = 3;
static NSUInteger const kAKIDirectorCount = 1;

typedef NSArray *(^AKIWorkersFactory)(Class class, NSUInteger count, id observer);;

@interface AKICarWash()
@property (nonatomic, retain) AKIDispatcher     *directorsDispatcher;
@property (nonatomic, retain) AKIDispatcher     *accountantsDispatcher;
@property (nonatomic, retain) AKIDispatcher     *washersDispatcher;

- (void)removeWorkerObservers;

- (void)initDispatcherWithProcessor;
- (void)initDispatcer;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    [self removeWorkerObservers];
    
    self.directorsDispatcher = nil;
    self.accountantsDispatcher = nil;
    self.washersDispatcher = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    [self initDispatcer];
    [self initDispatcherWithProcessor];

    return self;
}

- (void)initDispatcer {
    self.directorsDispatcher = [AKIDispatcher object];
    self.accountantsDispatcher = [AKIDispatcher object];
    self.washersDispatcher = [AKIDispatcher object];
}

- (void)initDispatcherWithProcessor {
    AKIWorkersFactory workersFactory = ^NSArray *(Class class, NSUInteger count, id observers) {
        return [NSArray objectsWithCount:count block:^ {
            AKIWorker *worker = [class object];
            [worker addObserver:observers];
            
            return worker;
        }];
    };
    
    [self.directorsDispatcher initWithProcessors:workersFactory([AKIDirector class],
                                                                kAKIDirectorCount,
                                                                nil)];
    [self.accountantsDispatcher initWithProcessors:workersFactory([AKIAccountant class],
                                                                  kAKIAccoutantCount,
                                                                  self.directorsDispatcher)];
    [self.washersDispatcher initWithProcessors:workersFactory([AKIWasher class],
                                                              kAKIWasherCount,
                                                                self.accountantsDispatcher)];
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar:(id)car {
    if (car) {
        [self.washersDispatcher processObject:car];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)removeWorkerObservers {
    void (^AKIRemoveObservers)(id collection, id observer) = ^(id collection, id observer) {
        for (AKIWorker *worker in collection) {
            [worker removeObserver:observer];
        }
    };
    
    AKIDispatcher *accountantsDispatcher = self.accountantsDispatcher;
    AKIRemoveObservers(accountantsDispatcher.processors, @[self.directorsDispatcher]);
    AKIRemoveObservers(self.washersDispatcher.processors, @[accountantsDispatcher]);
}

@end
