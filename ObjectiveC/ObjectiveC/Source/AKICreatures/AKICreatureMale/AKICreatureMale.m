//
//  AKICreatureMale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 05.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICreatureMale.h"
#import "AKICreature.h"

@implementation AKICreatureMale

- (void)goingToFight {
    NSLog(@"I'm %@ and I go to drink", self);
}

- (void)performGenderSpecificOperation {
    [self goingToFight];
}

@end
