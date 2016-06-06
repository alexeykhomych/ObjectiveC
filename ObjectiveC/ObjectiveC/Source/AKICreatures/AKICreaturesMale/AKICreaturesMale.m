//
//  AKICreaturesMale.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 05.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICreaturesMale.h"
#import "AKICreatures.h"

@implementation AKICreaturesMale

- (void)createCreatureMale {
    id *creature = [AKICreatures new];
}

- (void)goingToFigth {
    NSLog(@"Creatures %@ is figth", self);
}

@end