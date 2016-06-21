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

- (void)runProcessObjectOfWorkerWithClass:(Class)cls1 object:(id)object;

- (void)addCarToQueue:(AKICar *)car;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.cars = nil;
    
    [self.adminBuilding release];
    [self.carWashBuilding release];
    [self.office release];
    [self.box release];
    [self.queue release];
    
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
    [self.queue queue:car];
    [self washCar];
}

#pragma mark -
#pragma mark Private Methods

- (void)removeCar:(id)car {
    [self.cars removeObject:car];
}

- (void)washCar{
    AKICar *car = nil;
    
    while ((car = [self.queue.queue firstObject])) {
        AKIBox *box = [self.carWashBuilding freeOffice];
        
        if (!box) {
            return;
        }
        
        [box addCar:car];
        [self runProcessObjectOfWorkerWithClass:[AKIWasher class] object:car];
        [box removeCar:car];
        [self.queue dequeue];
        
        [self runProcessObjectOfWorkerWithClass:[AKIAccountant class] object:[self.carWashBuilding freeWorkerWithClass:[AKIWasher class]]];
        [self runProcessObjectOfWorkerWithClass:[AKIDirector class] object:[self.adminBuilding freeWorkerWithClass:[AKIAccountant class]]];
    }
}

- (void)runProcessObjectOfWorkerWithClass:(Class)cls object:(id)object {
    AKIWorker *worker = nil;
    
    if ([cls isSubclassOfClass:[AKIWasher class]]) {
        worker = [self.carWashBuilding freeWorkerWithClass:cls];
    } else {
        worker = [self.adminBuilding freeWorkerWithClass:cls];
    }
    
    if (!worker) {
        [self runProcessObjectOfWorkerWithClass:cls object:object];
    }
    
    [worker processObject:object];
}

@end
