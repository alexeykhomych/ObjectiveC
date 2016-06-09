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

- (instancetype)initCreature {
    return [super initCreature];
}

- (void)setName:(NSString *)name {
    self.name = name;
    [name release];
}

- (void)setAge:(NSUInteger)age {
    self.age = age;
}

- (void)setWeight:(NSUInteger)weight {
    self.weight = weight;
}

- (void)goingToFigth {
    NSLog(@"I'm %@ goint to fight", self);
}

@end