//
//  AKICreatureFemale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICreatureFemale.h"

@implementation AKICreatureFemale

- (AKICreature *)giveBirthToChild {
    NSLog(@"%@ gives birth", self);
    AKICreature *child = [AKICreature object];
    [self.children arrayByAddingObject:child];
    
    return child;
}

- (void)performGenderSpecificOperation {
    [self giveBirthToChild];
}

@end
