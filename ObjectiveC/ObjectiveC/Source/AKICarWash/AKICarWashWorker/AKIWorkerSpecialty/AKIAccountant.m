//
//  AKIAccountant.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAccountant.h"
#import "AKIWasher.h"

@implementation AKIAccountant

#pragma mark -
#pragma mark Public Methods

- (void)processObject:(AKIWasher *)object {
    [self takeMoneyFromObject:object];
}

@end
