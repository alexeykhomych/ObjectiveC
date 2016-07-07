//
//  AKIDirector.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIDirector.h"
#import "AKIAccountant.h"

@implementation AKIDirector

#pragma mark -
#pragma mark Public Methods

- (void)performWorkWithObject:(id)object {
    [self takeMoneyFromObject:object];
    [self makeRevenue];
}

#pragma mark -
#pragma mark Private Methods

- (void)makeRevenue {
    NSLog(@"Director make profit");
}

@end
