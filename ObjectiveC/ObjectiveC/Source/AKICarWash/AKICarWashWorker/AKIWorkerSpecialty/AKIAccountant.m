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
    [self giveMoneyToWorker:self.chief];
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    [worker takeMoney:self.money];
}

@end
