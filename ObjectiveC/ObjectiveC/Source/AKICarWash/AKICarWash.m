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
#import "AKIDirector.h"
#import "AKIAccountant.h"
#import "AKIOffice.h"
#import "AKIBox.h"

static NSUInteger const kAKIMoney = 10;

@interface AKICarWash()
@property (nonatomic, retain) NSMutableArray    *mutableBoxs;
@property (nonatomic, retain) NSMutableArray    *mutableWorkers;
@property (nonatomic, retain) NSMutableArray    *mutableCars;

- (void)queued:(NSMutableArray *)car;
- (id)getFreeWorker;
- (id)getFreeBox;

- (void)addBox;
- (void)removeBox:(AKIBox *)box;
- (void)removeCar:(AKICar *)car;
- (void)addWorker;
- (void)removeWorker:(AKIWasher *)worker;

@end

@implementation AKICarWash

#pragma mark
#pragma mark Init/dealloc

- (void)dealloc {
    self.mutableBoxs = nil;
    self.mutableWorkers = nil;
    self.mutableCars = nil;
    
    [super dealloc];
}

+ (instancetype)carWash {
    AKICarWash *carWash = [super object];
    carWash.mutableBoxs = [NSMutableArray object];
    carWash.mutableCars = [NSMutableArray object];
    carWash.mutableWorkers = [NSMutableArray object];
    
    return carWash;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)boxs {
    return [[self.mutableBoxs copy] autorelease];
}

- (NSArray *)workers {
    return [[self.mutableWorkers copy] autorelease];
}

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark
#pragma Public Implementations

- (void)washCar:(AKICar *)car {
    [self.mutableCars addObject:car];
    [self queued:self.mutableCars];
}

#pragma -
#pragma Private Implementations

- (id)getFreeBox {
    for (AKIBuilding *box in self.mutableBoxs) {
        if (![box isFull]) {
            return box;
        }
    }
    
    return nil;
}

- (void)removeCar:(id)car {
    [self.mutableCars removeObject:car];
}

- (void)addWorker{
    AKIWasher *washer = [AKIWasher object];
    AKIAccountant *accountant = [AKIAccountant object];
    AKIDirector *director = [AKIDirector object];
    
    [self.mutableWorkers addObject:washer];
    [self.mutableWorkers addObject:accountant];
    [self.mutableWorkers addObject:director];
}

- (void)removeWorker:(AKIWasher *)worker {
    [self.mutableWorkers removeObject:worker];
}

- (id)getFreeWorker {
    for (AKIWasher *washer in self.mutableWorkers) {
        if ([washer isFree]) {
            return washer;
        }
    }
    
    return nil;
}

- (void)addBox {
    [self.mutableBoxs addObject:[AKIBox object]];
}

- (void)queued:(NSMutableArray *)car {
    AKIBox *box = nil;
    AKIWasher *washer = nil;
    
    for (AKICar *currentCar in car) {
        box = [self getFreeBox];
        washer = [self getFreeWorker];
        
        if (box && washer) {
            box.full = YES;
            box.washer = washer;
            box.car = currentCar;
            
            [box.washer doJob:currentCar.money];
            
            box.full = NO;
            
            [self removeCar:box.car];
        } else {
            NSLog(@"Wait a few minets");
        }
    }
}

- (void)removeBox:(AKIBox *)box {
    [self.mutableBoxs removeObject:box];
}

@end
