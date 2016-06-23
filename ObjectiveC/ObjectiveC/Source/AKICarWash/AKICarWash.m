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
@property (nonatomic, retain)   NSMutableArray  *cars;
@property (nonatomic, retain)   AKIBuilding     *adminBuilding;
@property (nonatomic, retain)   AKIBuilding     *carWashBuilding;
@property (nonatomic, retain)   AKIOffice       *office;
@property (nonatomic, retain)   AKIBox          *box;
@property (nonatomic, retain)   AKIQueue        *queue;

- (void)addCarToQueue:(AKICar *)car;

- (void)runProcessObjectOfWorkerWithClassAndObject:(Class)cls object:(id)object;
- (AKIWorker *)freeWorkerWithClass:(Class)cls;
- (AKIWorker *)freeWorkerWithClassFromBuilding:(Class)cls building:(AKIBuilding *)building;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.cars = nil;
    
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

- (void)removeCar:(id)car {
    [self.cars removeObject:car];
}

- (void)washCar{
    AKICar *car = nil;
    
    while ((car = [self.queue dequeueObject])) {
        AKIBox *box = [self.carWashBuilding freeOffice];
        
        if (!box) {
            return;
        }
        
        [box addCar:car];
        [self runProcessObjectOfWorkerWithClass:[AKIWasher class] object:car];
        [box removeCar:car];
        
        if (car.clean) {
            [self.queue enqueueObject:car];
        }
        
        [self runProcessObjectOfWorkerWithClass:[AKIAccountant class] object:[self freeWorkerWithClass:[AKIWasher class]]];
        [self runProcessObjectOfWorkerWithClass:[AKIDirector class] object:[self freeWorkerWithClass:[AKIAccountant class]]];
    }
}

- (void)runProcessObjectOfWorkerWithClass:(Class)cls object:(id)object {
    [[self freeWorkerWithClass:cls] processObject:object];
}

- (AKIWorker *)freeWorkerWithClass:(Class)cls {
    AKIWorker *worker = nil;
    
    if ([cls isSubclassOfClass:[AKIWasher class]]) {
        worker = [self freeWorkerWithClass:cls building:self.carWashBuilding];
    } else {
        worker = [self freeWorkerWithClass:cls building:self.adminBuilding];
    }
    
    if (!worker) {
        return nil;
    }
    
    return worker;
}

- (AKIWorker *)freeWorkerWithClass:(Class)cls building:(AKIBuilding *)building {
    return [[building freeWorkerWithClass:cls] firstObject];
}

@end
