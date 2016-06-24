//
//  AKICreatureFemale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICreatureFemale.h"
#import "NSObject+AKIExtensions.h"

static NSString const *kAKIBirth = @"gives birth";

@implementation AKICreatureFemale

- (AKICreature *)giveBirthToChild {
    NSLog(@"%@ %@", self, kAKIBirth);
    AKICreature *child = [AKICreature object];
    [self.children arrayByAddingObject:child];
    
    return child;
}

- (void)performGenderSpecificOperation {
    [self giveBirthToChild];
}

@end
