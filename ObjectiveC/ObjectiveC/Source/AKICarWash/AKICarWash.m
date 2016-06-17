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
@property (nonatomic, retain)   NSMutableArray  *directors;
@property (nonatomic, retain)   NSMutableArray  *accountants;
@property (nonatomic, retain)   NSMutableArray  *washers;
@property (nonatomic, retain)   NSMutableArray  *cars;
@property (nonatomic, retain)   AKIBuilding     *adminBuilding;
@property (nonatomic, retain)   AKIOffice       *office;
@property (nonatomic, retain)   AKIBox          *box;

- (void)queued:(NSMutableArray *)car;
- (id)getFreeWorker:(NSString *)className;
- (id)getFreeBox;

- (void)addBox;
- (void)removeCar:(AKICar *)car;
- (void)addWorker;
- (void)removeWorker:(AKIWasher *)worker;
- (AKIWasher *)freeWasher;
- (AKIDirector *)freeDirector;
- (AKIAccountant *)freeAccountant;

@end

@implementation AKICarWash

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carWash {
    return [self init];
}

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.directors = nil;
    self.accountants = nil;
    self.washers = nil;
    
    [super dealloc];
}

- (id)init {
    AKICarWash *carWash = [super init];
    
    carWash.directors = [NSMutableArray object];
    carWash.accountants = [NSMutableArray object];
    carWash.washers = [NSMutableArray object];
    
    [carWash initCarWash];
    
    return carWash;
}

- (void)initCarWash {
    AKIBuilding *adminBuilding = [AKIBuilding init];
    AKIBuilding *carWashBuilding = [AKIBuilding init];
    AKIOffice *office = [AKIOffice office];
    AKIBox *box = [AKIBox init];
    
    AKIWasher *washer = [AKIWasher init];
    AKIAccountant *accountant = [AKIAccountant init];
    AKIDirector *director = [AKIDirector init];
    
    [adminBuilding addOffice:office];
    [adminBuilding addWorker:director];
    [adminBuilding addWorker:accountant];
    
    [carWashBuilding addOffice:box];
    [carWashBuilding addWorker:washer];
    [box addWorker:washer];
    
    self.adminBuilding = adminBuilding;
    self.office = office;
    self.box = box;
    
    [self addDirector:director];
    [self addAccountant:accountant];
    [self addWasher:washer];
}

#pragma mark -
#pragma mark Public Methods

- (void)washCar{
    for (AKICar *currentCar in self.cars) {
        AKIWasher *washer = [self freeWasher];
        AKIAccountant *accountant = [self freeAccountant];
        AKIDirector *director = [self freeDirector];
        
        [washer processObject:currentCar];
        [accountant processObject:washer];
        [director processObject:accountant];
        
        [self removeCar:currentCar];
    }
}

#pragma mark -
#pragma mark Private Methods

- (id)getFreeBox {
    return ![self.box isFull] ? self.box : nil;
}

- (void)removeCar:(id)car {
    [self.cars removeObject:car];
}

- (void)addDirector:(AKIWorker *)worker {
    [self.directors addObject:worker];
    [self.adminBuilding addWorker:worker];
}

- (void)addAccountant:(AKIWorker *)worker {
    [self.accountants addObject:worker];
    [self.adminBuilding addWorker:worker];
}

- (void)addWasher:(AKIWorker *)worker {
    [self.washers addObject:worker];
    [self.adminBuilding addWorker:worker];
}

- (void)removeWorker:(AKIWorker *)worker {
    [self.washers removeObject:worker];
    [self.accountants removeObject:worker];
    [self.directors removeObject:worker];
    
    [self.adminBuilding removeWorker:worker];
    [self.box removeWorker:worker];
}

- (AKIWasher *)freeWasher {
    for (AKIWasher *currentWasher in self.washers) {
        if ([currentWasher isFree]) {
            return currentWasher;
        }
    }
    
    return nil;
}
- (AKIDirector *)freeDirector {
    for (AKIDirector *currentDirector in self.directors) {
        if ([currentDirector isFree]) {
            return currentDirector;
        }
    }
    
    return nil;
}
- (AKIAccountant *)freeAccountant {
    for (AKIAccountant *currentAccountant in self.accountants) {
        if ([currentAccountant isFree]) {
            return currentAccountant;
        }
    }
    
    return nil;
}

@end
