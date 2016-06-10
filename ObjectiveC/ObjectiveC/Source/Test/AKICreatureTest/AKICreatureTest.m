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
    
    AKICreatureMale *man = [[AKICreatureMale alloc] initCreature];
    AKICreatureFemale *woman = [[AKICreatureFemale alloc] initCreature];
    
    [man setGender:AKIGenderMale];
    [woman setGender:AKIGenderFemale];
    
    NSString *sayHi = @"Hi";
    
    [man sayPhrase:sayHi];
    
    AKICreature *child1 = [woman giveBirthChild];
    AKICreature *child2 = [woman giveBirthChild];
    AKICreature *child3 = [woman giveBirthChild];
    
    [test AKICreatureTestAddChild:woman : child1];
    [test AKICreatureTestAddChild:woman : child2];
    [test AKICreatureTestAddChild:man : child3];
    
    [man sayPhrase:sayHi];
    
    [test AKICreatureTestRemoveChild:child1 : woman];
    
    [test AKICreatureTestBehavior:man];
    [test AKICreatureTestBehavior:woman];
    
    [test AKICreatureTestRemoveChild:woman : child2];
    [test AKICreatureTestRemoveChild:man : child3];
    
    AKICreature *child4 = [woman giveBirthChild];
    
    [test AKICreatureTestAddChild:child3 :child4];
    
    [man sayPhrase:sayHi];
    
    [test AKICreatureTestRemoveChild:child3 : child4];
    
    [test autorelease];
//        [child1 autorelease];
//        [child2 autorelease];
//        [child3 autorelease];
//        [man release];
//        [woman autorelease];

}
- (void)AKICreatureTestAddChild:(AKICreature *)creature : (AKICreature *)child {
    [creature addChild:child];
}
- (void)AKICreatureTestRemoveChild:(AKICreature *)child : (AKICreature *)creature {
    [creature removeChild:child];
}
- (void)AKICreatureTestBehavior:(AKICreature *)creature {
    [creature performGenderSpecificOperation];
}

@end
