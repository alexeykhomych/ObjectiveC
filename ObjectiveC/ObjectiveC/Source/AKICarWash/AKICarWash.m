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

#import "AKIObservableObject.h"

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
        
        AKIWasher *washer = [self workerWithClass:[AKIWasher class]];
        AKIAccountant *accountant = [self workerWithClass:[AKIAccountant class]];
        AKIDirector *director = [self workerWithClass:[AKIDirector class]];
        
        [box addCar:car];
        
        [washer performSelector:@selector(processObject:) withObject:car];
        
        [box removeCar:car];
        
        if (!car.clean) {
            [self.queue enqueueObject:car];
        }
        
        [accountant performSelector:@selector(processObject:) withObject:washer];
        [director performSelector:@selector(processObject:) withObject:accountant];
    }
}

- (id)workerWithClass:(Class)cls {
    return [self freeWorkerWithClass:cls building:[self workerWorkPlace:cls]];
}

- (id)freeWorkerWithClass:(Class)cls building:(AKIBuilding *)building {
    NSArray *workers = [building workerWithClass:cls];
    for (AKIWorker *worker in workers) {
        if (worker.free) {
            return worker;
        }
    }
    
    return nil;
}

- (AKIBuilding *)workerWorkPlace:(Class)cls {
    if ([cls isSubclassOfClass:[AKIWasher class]]) {
        return self.carWashBuilding;
    }
    
    return self.adminBuilding;
}

@end
