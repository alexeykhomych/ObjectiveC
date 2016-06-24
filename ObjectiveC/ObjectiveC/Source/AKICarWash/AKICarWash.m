//
//  AKICarWash.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWash.h"

#import "NSObject+AKIExtensions.h"

#import "AKIWasher.h"
#import "AKIDirector.h"
#import "AKIAccountant.h"

#import "AKIOffice.h"
#import "AKIBox.h"

#import "AKIQueue.h"

@interface AKICarWash()
@property (nonatomic, retain)   AKIBuilding     *adminBuilding;
@property (nonatomic, retain)   AKIBuilding     *carWashBuilding;
@property (nonatomic, retain)   AKIOffice       *office;
@property (nonatomic, retain)   AKIBox          *box;
@property (nonatomic, retain)   AKIQueue        *queue;

- (void)addCarToQueue:(AKICar *)car;

- (void)runProcessObjectOfWorkerWithClass:(Class)cls object:(id)object;
- (AKIWorker *)workerWithClass:(Class)cls;
- (AKIWorker *)freeWorkerWithClass:(Class)cls building:(AKIBuilding *)building;
- (AKIBuilding *)workerWorkPlace:(Class)cls;

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
    
    return self;
}

- (void)initCarWash {
    AKIBuilding *adminBuilding = [AKIBuilding object];
    AKIBuilding *carWashBuilding = [AKIBuilding object];
    AKIOffice *office = [AKIOffice object];
    AKIBox *box = [AKIBox object];
    
    AKIWasher *washer = [AKIWasher object];
    AKIAccountant *accountant = [AKIAccountant object];
    AKIDirector *director = [AKIDirector object];
    
    AKIQueue *queue = [AKIQueue object];
    
    [office addWorker:director];
    [office addWorker:accountant];
    [box addWorker:washer];
    
    [adminBuilding addOffice:office];
    [carWashBuilding addOffice:box];
    
    self.adminBuilding = adminBuilding;
    self.carWashBuilding = carWashBuilding;
    self.office = office;
    self.box = box;
    self.queue = queue;
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
        
        [box addCar:car];
        [self runProcessObjectOfWorkerWithClass:[AKIWasher class] object:car];
        [box removeCar:car];
        
        if (!car.clean) {
            [self.queue enqueueObject:car];
        }
        
        [self runProcessObjectOfWorkerWithClass:[AKIAccountant class] object:[self workerWithClass:[AKIWasher class]]];
        [self runProcessObjectOfWorkerWithClass:[AKIDirector class] object:[self workerWithClass:[AKIAccountant class]]];
    }
}

- (void)runProcessObjectOfWorkerWithClass:(Class)cls object:(id)object {
    [[self workerWithClass:cls] processObject:object];
}

- (AKIWorker *)workerWithClass:(Class)cls {
    AKIBuilding *building = [self workerWorkPlace:cls];
    AKIWorker *worker = [self freeWorkerWithClass:cls building:building];
    
    return worker;
}

- (AKIWorker *)freeWorkerWithClass:(Class)cls building:(AKIBuilding *)building {
    return [[building freeWorkerWithClass:cls] firstObject];
}

- (AKIBuilding *)workerWorkPlace:(Class)cls {
    if ([cls isSubclassOfClass:[AKIWasher class]]) {
        return self.carWashBuilding;
    } else {
        return self.adminBuilding;
    }
}

@end
