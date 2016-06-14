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
#import "AKIOffice.h"

static NSUInteger const kAKIMaxWorkerCount = 5;
static NSUInteger const kAKIMaxBoxCount = 5;
static NSUInteger const kAKIMaxOfficeCount = 3;
static NSUInteger const kAKIMoney = 10;

@interface AKICarWash()
@property (nonatomic, retain) NSMutableArray    *_boxs;
@property (nonatomic, retain) NSMutableArray    *_workers;
@property (nonatomic, retain) NSMutableArray    *_cars;
@property (nonatomic, retain) NSMutableArray    *_carWash;
@property (nonatomic, retain) NSMutableArray    *_offices;
@property (nonatomic, assign) NSUInteger        workerCount;
@property (nonatomic, assign) NSUInteger        carCount;
@property (nonatomic, assign) NSUInteger        boxCount;
@property (nonatomic, assign) NSUInteger        officeCount;

- (id)getFreeWorker;
- (id)getFreeBox;
- (void)addBox:(id)box;
- (void)addOffice:(id)office;
- (void)removeCar:(id)car;

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
    carWash._carWash = [NSMutableArray object];
    carWash._offices = [NSMutableArray object];
    
    AKIOffice *accountant = [AKIOffice officeInitWithName:@"Accountant"];
    AKIOffice *admin = [AKIOffice officeInitWithName:@"Administrative"];
    
    [carWash addOffice:accountant];
    [carWash addOffice:admin];
    
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

- (NSArray *)carWash {
    return [[self._carWash copy] autorelease];
}

- (NSArray *)offices {
    return [[self.offices copy] autorelease];
}

#pragma mark
#pragma Public Implementations

- (void)addCar:(id)car {
    AKIBuilding *box = [self getFreeBox];
    AKIWasher *washer = [self getFreeWorker];
    
    if (box && washer) {
        box.Full = YES;
        
        [self._boxs addObject:car];
        [self._boxs addObject:washer];
        
        [washer doJob:kAKIMoney];
        
        [self._boxs removeObject:car];
        [self._boxs removeObject:washer];
        
        box.Full = NO;
    }
}

- (void)removeCar:(id)car {
    [self._cars removeObject:car];
    [self setCarCount:self.carCount - 1];
    [self._boxs removeObject:car];
}

- (void)addWorker:(AKIWasher *)worker {
    if ([self workerCount] < kAKIMaxWorkerCount) {
        [self._workers addObject:worker];
        [self setWorkerCount:self.workerCount + 1];
    }
}

- (void)removeWorker:(AKIWasher *)worker {
    [self._workers removeObject:worker];
    [self setWorkerCount:self.workerCount - 1];
}

- (id)getFreeWorker {
    for (AKIWasher *washer in self._workers) {
        if ([washer isFree]) {
            return washer;
        }
    }
    
    return nil;
}

- (id)getFreeBox {
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

#pragma -
#pragma Private Implementations

- (void)addBox:(id)box {
    [self._boxs addObject:box];
    [self setBoxCount:self.boxCount + 1];
}

- (void)addOffice:(id)office {
    [self._boxs addObject:office];
    [self setOfficeCount:self.officeCount + 1];
}

@end
