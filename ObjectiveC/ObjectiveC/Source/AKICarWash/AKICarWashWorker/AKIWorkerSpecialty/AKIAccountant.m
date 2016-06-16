//
//  AKIAccountant.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAccountant.h"

@implementation AKIAccountant

- (void)doJob {
    [self setFree:NO];
    [self giveMoneyToWorker:self.chief];
    [self setFree:YES];
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
    [self setExperience:1];
    [worker setSalary:self.money * 0.1];
}

@end
