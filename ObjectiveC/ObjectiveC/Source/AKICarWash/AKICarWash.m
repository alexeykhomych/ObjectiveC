//
//  AKICarWash.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWash.h"

#import "NSObject+AKIExtensions.h"
#import "NSArray+NSArray_AKIExtensions.h"

#import "AKIWasher.h"
#import "AKIDirector.h"
#import "AKIAccountant.h"

#import "AKIOffice.h"
#import "AKIBox.h"

#import "AKIQueue.h"

#import "AKIObservableObject.h"

static NSUInteger const kAKIMaxWasherCount = 1;

@interface AKICarWash()
@property (nonatomic, retain)   AKIBuilding     *adminBuilding;
@property (nonatomic, retain)   AKIBuilding     *carWashBuilding;
@property (nonatomic, retain)   AKIOffice       *office;
@property (nonatomic, retain)   AKIBox          *box;
@property (nonatomic, retain)   AKIQueue        *queue;

- (void)addCarToQueue:(AKICar *)car;

- (id)workerWithClass:(Class)cls;
- (id)freeWorkerWithClass:(Class)cls building:(AKIBuilding *)building;
- (AKIBuilding *)workerWorkPlace:(Class)cls;

- (id)reservedWasher;
- (id)reservedAccountant;
- (id)reservedDirector;
- (NSArray *)reservedFreeWorkerWithClass:(Class)cls;
- (id)freeWorkerPredicate;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.adminBuilding = nil;
    self.carWashBuilding = nil;
    self.office = nil;
    self.box = nil;
    self.queue = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    
    [self initCarWash];
    self.queue = [AKIQueue object];
    
    return self;
}

- (void)initCarWash {
    AKIBuilding *adminBuilding = [AKIBuilding object];
    AKIBuilding *carWashBuilding = [AKIBuilding object];
    AKIOffice *office = [AKIOffice object];
    AKIBox *box = [AKIBox object];
    
    AKIAccountant *accountant = [AKIAccountant object];
    AKIDirector *director = [AKIDirector object];
    
    [office addWorker:director];
    [office addWorker:accountant];
    [accountant addObserver:director];
    
    for (NSUInteger i = 0; i < kAKIMaxWasherCount; i++) {
        AKIWasher *washer = [AKIWasher object];
        [box addWorker:washer];
        [washer addObservers:@[accountant, self]];
    }
    
    [adminBuilding addOffice:office];
    [carWashBuilding addOffice:box];
    
    self.adminBuilding = adminBuilding;
    self.carWashBuilding = carWashBuilding;
    self.office = office;
    self.box = box;
}

#pragma mark -
#pragma mark Public Methods

- (void)addCarToQueue:(AKICar *)car {
    [self.queue enqueueObject:car];
    [self washCar];
}

#pragma mark -
#pragma mark Private Methods

- (void)washCar{
    AKICar *car = nil;
    
    while ((car = [self.queue dequeueObject])) {
        AKIBox *box = [self.carWashBuilding freeOffice];
        
        AKIWasher *washer = [self reservedWasher];
        
        [box addCar:car];
        
        [washer processObject:car];
        
        [box removeCar:car];
        
        if (!car.clean) {
            [self.queue enqueueObject:car];
        }
    }
}

- (id)workerWithClass:(Class)cls {
    return [self freeWorkerWithClass:cls building:[self workerWorkPlace:cls]];
}

- (AKIBuilding *)workerWorkPlace:(Class)cls {
    if ([cls isSubclassOfClass:[AKIWasher class]]) {
        return self.carWashBuilding;
    }
    
    return self.adminBuilding;
}

- (id)reservedWasher {
    return [self reservedFreeWorkerWithClass:[AKIWasher class]];
}
- (id)reservedAccountant {
    return [self reservedFreeWorkerWithClass:[AKIAccountant class]];
}

- (id)reservedDirector {
    return [self reservedFreeWorkerWithClass:[AKIDirector class]];
}

- (id)reservedFreeWorkerWithClass:(Class)cls {
    AKIWorker *worker = [[[self workerWorkPlace:cls] workerWithClass:cls] firstObject];
    worker.state = AKIWorkerPending;
    
    return worker;
}

- (id)freeWorkerPredicate {
    return [NSPredicate predicateWithBlock:^(AKIWorker *worker, NSDictionary *bindings) { return (BOOL)!AKIWorkerBusy; }];
}

- (NSArray *)freeWorkerWithClass:(Class)cls {
    return [[self workerWithClass:cls] filterWithBlock:^BOOL(AKIWorker *worker) { return !AKIWorkerBusy; }];
}

@end
