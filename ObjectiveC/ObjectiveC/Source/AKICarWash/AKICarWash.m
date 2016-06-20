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
#import "AKIQueue.h"

@interface AKICarWash()
@property (nonatomic, retain)   NSMutableArray  *cars;
@property (nonatomic, retain)   AKIBuilding     *adminBuilding;
@property (nonatomic, retain)   AKIBuilding     *carWashBuilding;
@property (nonatomic, retain)   AKIOffice       *office;
@property (nonatomic, retain)   AKIBox          *box;
@property (nonatomic, retain)   AKIQueue        *queue;

- (id)freeBox;

- (AKIWorker *)freeWorkerWithClass:(Class)cls;

- (void)addCarToQueue:(AKICar *)car;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.cars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self initCarWash];
    
    return self;
}

- (void)initCarWash {
    AKIBuilding *adminBuilding = [[AKIBuilding new] autorelease];
    AKIBuilding *carWashBuilding = [[AKIBuilding new] autorelease];
    AKIOffice *office = [[AKIOffice new] autorelease];
    AKIBox *box = [[AKIBox new] autorelease];
    
    AKIWasher *washer = [[AKIWasher new] autorelease];
    AKIAccountant *accountant = [[AKIAccountant new] autorelease];
    AKIDirector *director = [[AKIDirector new] autorelease];
    
    AKIQueue *queue = [[AKIQueue new] autorelease];
    
    [office addWorker:director];
    [office addWorker:accountant];
    
    [carWashBuilding addOffice:box];
    [box addWorker:washer];
    
    self.adminBuilding = adminBuilding;
    self.carWashBuilding = carWashBuilding;
    self.office = office;
    self.box = box;
    self.queue = queue;
}

#pragma mark -
#pragma mark Public Methods

- (void)addCarToQueue:(AKICar *)car {
    [self.queue addCar:car];
}

- (void)washCar{
    AKICar *car = nil;
    
    while ((car = [self.queue nextCar])) {
        AKIBox *box = [self freeBox];
        AKIWorker *washer = [self freeWorkerWithClass:[AKIWasher class]];
        
        if (box && washer) {
            [box addCar:car];
            
            [washer processObject:car];
            [self.queue removeCar];
            
            [box removeCar:car];
        }
    }
}

#pragma mark -
#pragma mark Private Methods

- (id)freeBox {
    return ![self.box isFull] ? self.box : nil;
}

- (void)removeCar:(id)car {
    [self.cars removeObject:car];
}

- (AKIWorker *)freeWorkerWithClass:(Class)cls {
    NSArray *workers = [self.carWashBuilding freeWorkers];
    
    for (AKIWorker *worker in workers) {
        if ([worker isKindOfClass:cls] && worker.free) {
            return worker;
        }
    }
    
    return nil;
}

@end
