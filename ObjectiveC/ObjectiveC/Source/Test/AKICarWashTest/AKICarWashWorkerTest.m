//
//  AKICarWashWorkerTest.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 11.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashWorkerTest.h"
#import "AKICarWash.h"
#import "AKIWorker.h"
#import "AKIWasher.h"
#import "AKIAccountant.h"
#import "AKIDirector.h"

#import "AKIBuilding.h"

#import "NSObject+AKICategory.h"

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    NSInteger money = 10;
    
    AKIBuilding *box = [AKIBuilding building];
    
    AKIWasher *washer = [AKIWasher worker];
    AKIAccountant *accountant = [AKIAccountant worker];
    AKIDirector *director = [AKIDirector worker];
    
    AKICarWash *carWash = [AKICarWash carWash];
    
    [carWash addBox:box];
    
    [washer setChief:accountant];
    [accountant setChief:director];
    
    NSObject *car = [NSObject object];
    
    [carWash addWorker:washer];
    [carWash addCar:car];
}

@end
