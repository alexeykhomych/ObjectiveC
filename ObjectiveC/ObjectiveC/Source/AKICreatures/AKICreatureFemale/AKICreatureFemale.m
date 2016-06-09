//
//  AKICreatureFemale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICreatureFemale.h"

@implementation AKICreatureFemale

- (instancetype)initCreature {
    return [super init];
}

- (AKICreature *)giveBirthChild {
    NSLog(@"%@ gives birth", self);

    return [self initCreature];
}

- (void)performGenderSpecificOperation {
    self.gender == AKIGenderFemale ? [self giveBirthChild] : nil;
}

@end
