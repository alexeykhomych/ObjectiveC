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
#import "NSObject+AKICategory.h"

@implementation AKICreatureTest

- (void)performTest {
    NSString *sayHi = @"Hi";
    NSUInteger count = 10;
    
    AKICreatureMale *man = [AKICreatureMale object];
    AKICreatureFemale *woman = [AKICreatureFemale object];
    
    [man sayPhrase:sayHi];
    
    NSMutableArray *array = [NSMutableArray object];
    [array addObject:man];
    [array addObject:woman];
    
    for (uint64 i = 0; i < count; i++) {
        [array addObject:[woman giveBirthToChild]];
    }
    
    for (AKICreature *creature in array) {
        [creature performGenderSpecificOperation];
    }

    [man addChild:[array objectAtIndex:0]];
    
    [man sayPhrase:sayHi];
    
    [woman removeChild:[array objectAtIndex:0]];
    
    [man sayPhrase:sayHi];
}

@end
