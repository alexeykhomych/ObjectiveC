//
//  AKICarWashWorkerTest.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 11.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashWorkerTest.h"
#import "AKIWorker.h"
#import "AKIWasher.h"
#import "AKIAccountant.h"
#import "AKIDirector.h"

#import "AKIBuilding.h"

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    NSInteger money = 10;
    
    AKIWasher *washer = [AKIWasher worker];
    AKIAccountant *accountant = [AKIAccountant worker];
    AKIDirector *director = [AKIDirector worker];
    
    
    
    [washer setChief:accountant];
    [accountant setChief:director];
    
    [washer takeMoney:money];
    
    [washer doJob:money];
    [accountant doJob];
}

@end
