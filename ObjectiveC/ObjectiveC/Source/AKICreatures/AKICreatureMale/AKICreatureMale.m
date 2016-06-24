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

static NSString const *kAKIDrink = @"I go to drink";

@implementation AKICreatureMale

- (void)goingToFight {
    NSLog(@"%@", kAKIDrink);
}

- (void)performGenderSpecificOperation {
    [self goingToFight];
}

@end
