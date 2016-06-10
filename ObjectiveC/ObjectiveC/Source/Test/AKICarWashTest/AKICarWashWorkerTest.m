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

@implementation AKICarWashWorkerTest

- (void)performWorkerTest {
    NSInteger money = 10;
    
    AKIWorker *washer = [AKIWorker worker];
    AKIWorker *accountant = [AKIWorker worker];
//    AKIWorker *director = [AKIWorker worker];
    
    [washer doJob:money];
    [accountant doJob];
}

@end
