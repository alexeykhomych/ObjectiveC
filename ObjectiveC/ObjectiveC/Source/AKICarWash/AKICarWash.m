//
//  AKICarWash.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWash.h"
#import "NSObject+AKICategory.h"
#import "AKIWasher.h"

static NSUInteger const kAKIMaxWorkerCount = 5;
static NSUInteger const kAKIMaxBoxCount = 5;
static NSUInteger const kAKIMoney = 10;

@interface AKICarWash()
@property (nonatomic, retain) NSMutableArray *_boxs;
@property (nonatomic, retain) NSMutableArray *_workers;
@property (nonatomic, retain) NSMutableArray *_cars;

@end

@implementation AKICarWash

#pragma mark
#pragma mark Init/dealloc

- (void)dealloc {
    self._boxs = nil;
    self._workers = nil;
    self._cars = nil;
    
    [super dealloc];
}

+ (instancetype)carWash {
    AKICarWash *carWash = [super object];
    carWash._boxs = [NSMutableArray object];
    carWash._cars = [NSMutableArray object];
    carWash._workers = [NSMutableArray object];
    
    return carWash;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)boxs {
    return [[self._boxs copy] autorelease];
}

- (NSArray *)workers {
    return [[self._workers copy] autorelease];
}

- (NSArray *)cars {
    return [[self._cars copy] autorelease];
}

#pragma mark
#pragma Public Implementations

- (void)addCar:(id)car {
    if ([self getFreeBox] && [self getFreeWorker]) {
        [self._cars addObject:car];
        
        AKIWasher *washer = (AKIWasher *)[self getFreeWorker];
        [washer doJob:kAKIMoney];
    } else {
        //[NSThread sleepForTimeInterval:10]
        //[self addCar:car];
    }
}

- (void)removeCar:(id)car {
    [self._cars removeObject:car];
    [self setCarCount:self.carCount - 1];
}

- (void)addWorker:(AKIWorker *)worker {
    if ([self workerCount] < kAKIMaxWorkerCount) {
        [self._workers addObject:worker];
        [self setWorkerCount:self.workerCount + 1];
    }
}

- (void)removeWorker:(AKIWorker *)worker {
    [self._workers removeObject:worker];
    [self setWorkerCount:self.workerCount - 1];
}

- (AKIWorker *)getFreeWorker {
    for (AKIWorker *worker in self._workers) {
        if ([worker isFree]) {
            return worker;
        }
    }
    
    return nil;
}

- (AKIBuilding *)getFreeBox {
    for (AKIBuilding *box in self._boxs) {
        if (![box isFull]) {
            return box;
        }
    }
    
    return nil;
}

- (void)setWorkerCount:(NSUInteger)workerCount {
    _workerCount = workerCount;
}

- (void)addBoxs:(id)box {
    if (kAKIMaxBoxCount > [self boxCount]) {
        [self._boxs addObject:box];
        [self setBoxCount:self.boxCount + 1];
    }
}

@end
