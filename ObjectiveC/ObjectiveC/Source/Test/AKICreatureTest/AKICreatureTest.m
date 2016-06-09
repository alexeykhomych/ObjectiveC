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

@implementation AKICreatureTest

- (void)AKICreatureTestCreate {
    AKICreatureTest *test = [[AKICreatureTest alloc] init];
    
    AKICreatureMale *man = [[AKICreatureMale alloc] init];
    AKICreatureFemale *woman = [[AKICreatureFemale alloc] init];
    
    [man setGender:AKIGenderMale];
    [woman setGender:AKIGenderFemale];
    
    NSString *sayHi = @"Hi";
    
    [man sayAnything:sayHi];
    
    AKICreature *child1 = [woman giveBirthChild];
    AKICreature *child2 = [woman giveBirthChild];
    AKICreature *child3 = [woman giveBirthChild];
    
    [test AKICreatureTestAddChild:woman : child1];
    [test AKICreatureTestAddChild:woman : child2];
    [test AKICreatureTestAddChild:man : child3];
    
    [man sayAnything:sayHi];
    
    [test AKICreatureTestRemoveChild:child1 : woman];
    
    [test AKICreatureTestBehavior:man];
    [test AKICreatureTestBehavior:woman];
    
    [test AKICreatureTestRemoveChild:woman : child2];
    [test AKICreatureTestRemoveChild:man : child3];
}
- (void)AKICreatureTestAddChild:(AKICreature *)creature : (AKICreature *)child {
    [creature addChildToArray:child];
}
- (void)AKICreatureTestRemoveChild:(AKICreature *)child : (AKICreature *)creature {
    [creature removeChildFromArray:child];
}
- (void)AKICreatureTestBehavior:(AKICreature *)creature {
    [creature performGenderSpecificOperation];
}

@end
