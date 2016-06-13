//
//  AKIAccountant.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAccountant.h"

@interface AKIAccountant()
@property (nonatomic, assign) AKIBuilding *_workPlace;

@end

@implementation AKIAccountant

- (void)doJob {
    [self setIsFree:NO];
    [self giveMoneyToWorker:self.chief];
    [self setIsFree:YES];
}

- (void)takeMoney:(NSInteger)money {
    self.money += money;
    NSLog(@"zbs. bablo %@", [self className]);
    
    [self calculateSalary:self];
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    NSLog(@"Just a little time. I will give money to %@", [self.chief className]);
    [worker takeMoney:self.money];
}

- (void)calculateSalary:(AKIWorker *)worker {
    [self setExpirience:1];
    [worker setSalary:self.money * 0.1];
}

- (void)setWorkPlace:(AKIBuilding *)workPlace {
    self._workPlace = workPlace;
}

- (AKIBuilding *)getWorkPlace {
    return self._workPlace;
}

@end
