//
//  AKICreatureTest.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICreatureTest.h"

#import "AKICreatureMale.h"
#import "AKICreatureFemale.h"
#import "AKICreature.h"

#import "NSObject+AKIExtensions.h"

static NSUInteger const kAKICount = 10;

@implementation AKICreatureTest

- (void)performTest {
    NSString *sayHi = @"Hi";
    
    AKICreatureMale *man = [AKICreatureMale object];
    AKICreatureFemale *woman = [AKICreatureFemale object];
    
    [man sayPhrase:sayHi];
    
    NSMutableArray *array = [NSMutableArray object];
    [array addObject:man];
    [array addObject:woman];
    
    for (NSUInteger i = 0; i < kAKICount; i++) {
        [array addObject:[woman giveBirthToChild]];
    }
    
    for (AKICreature *creature in array) {
        [creature performGenderSpecificOperation];
    }

    [man addChild:array[0]];
    
    [man sayPhrase:sayHi];
    
    [woman removeChild:[array objectAtIndex:0]];
    
    [man sayPhrase:sayHi];
}

@end
