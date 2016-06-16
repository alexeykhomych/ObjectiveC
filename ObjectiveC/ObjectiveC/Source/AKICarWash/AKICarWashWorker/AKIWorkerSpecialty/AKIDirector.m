//
//  AKIDirector.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDirector.h"
#import "NSObject+AKICategory.h"

@implementation AKIDirector

- (instancetype)director {
    AKIDirector *director = [AKIDirector object];

    
    return director;
}

- (void)doJob {
    [self setFree:NO];
    [self makeRevenue:self.money];
    [self setFree:YES];
}

- (void)takeMoney:(NSInteger)money {
    self.money = money;
    [self makeRevenue:self.money];
}

- (void)makeRevenue:(NSInteger)money {
    self.revenue += money;
    
    NSLog(@"%@ polychil bablo", self.className);
    
    if (self.revenue > 100) {
        NSLog(@"%@: vse pizdec. poidy kyplu yahtu", self.className);
    }
}

@end
