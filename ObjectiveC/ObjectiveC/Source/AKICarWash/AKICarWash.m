//
//  AKICarWash.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWash.h"
#import "NSObject+AKICategory.h"

@interface AKICarWash()
@property (nonatomic, assign) NSMutableArray *_boxs;
@property (nonatomic, assign) NSMutableArray *_workers;
@property (nonatomic, assign) NSMutableArray *_cars;

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
    return [[[self alloc] init] autorelease];
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
    [self._cars addObject:car];
}

- (void)removeCar:(id)car {
    [self._cars removeObject:car];
}

- (void)addWorker:(AKIWorker *)worker {
    [self._workers addObject:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    [self._workers removeObject:worker];
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
        if ([box isFree]) {
            return box;
        }
    }
    
    return nil;
}

@end
