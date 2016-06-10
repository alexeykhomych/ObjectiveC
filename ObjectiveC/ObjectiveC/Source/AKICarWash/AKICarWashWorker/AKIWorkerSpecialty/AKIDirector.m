//
//  AKIDirector.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDirector.h"

@implementation AKIDirector

- (void)doJob {
    [self makeRevenue:self.money];
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
    [self makeRevenue:self.money];
}

- (void)makeRevenue:(NSInteger)money {
    self.revenue += money;
    NSLog(@"vse pizdec. poidy kyplu yahtu");
}

@end
