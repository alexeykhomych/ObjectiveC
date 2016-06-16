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
#import "SingletonWorkers.h"

static NSUInteger const kAKIMoney = 10;

@interface AKICarWash()
@property (nonatomic, retain) NSMutableArray    *mutableBoxs;
@property (nonatomic, retain) NSMutableArray    *mutableWorkers;
@property (nonatomic, retain) NSMutableArray    *mutableCars;

- (void)queued:(NSMutableArray *)car;
- (id)getFreeWorker:(NSString *)className;
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
    
    [carWash addBox];
    [carWash addWorker];
    
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

- (void)addWorker {
    AKIWasher *washer = [AKIWasher worker];
    AKIAccountant *accountant = [AKIAccountant worker];
    AKIDirector *director = [AKIDirector worker];
    
    [self.mutableWorkers addObject:washer];
    [self.mutableWorkers addObject:accountant];
    [self.mutableWorkers addObject:director];
    
}

- (void)removeWorker:(AKIWasher *)worker {
    [self.mutableWorkers removeObject:worker];
}

- (id)getFreeWorker:(NSString *)className {
    SingletonWorkers *s = [SingletonWorkers sharedInstance];
    for (NSMutableArray *iteration in s.workers) {
        NSMutableDictionary *dictionary = (NSMutableDictionary *)iteration;
        AKIWorker *worker = [dictionary objectForKey:className];
        
        if ([worker isFree]) {
            return worker;
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
        washer = [self getFreeWorker:AKIWasher.className];
        
        if (box && washer) {
            box.full = YES;
            box.washer = washer;
            box.car = currentCar;
            
            [box.washer doJob:currentCar.money];
            
            [self removeCar:box.car];
            box.full = NO;
        } else {
            NSLog(@"Wait a few minets");
        }
    }
}

- (void)removeBox:(AKIBox *)box {
    [self.mutableBoxs removeObject:box];
}

@end
