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
#import "AKIBox.h"

#import "AKICar.h"

#import "NSObject+AKICategory.h"

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    AKICar *car = [AKICar car];
    AKICarWash *carWash = [AKICarWash carWash];
    
    [carWash washCar:car];
}

@end
