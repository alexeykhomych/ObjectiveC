//
//  AKICreatureFemale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICreatureFemale.h"

@implementation AKICreatureFemale

- (AKICreature *)giveBirthChild {
    NSLog(@"%@ gives birth", self);

    return [AKICreature object];
}

- (void)performGenderSpecificOperation {
    [self giveBirthChild];
}

@end
