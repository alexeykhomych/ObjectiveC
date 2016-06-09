//
//  AKICreatureTest.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 09.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICreature.h"

@interface AKICreatureTest : AKICreature

- (void)AKICreatureTestCreate;
- (void)AKICreatureTestAddChild:(AKICreature *)creature : (AKICreature *)child;
- (void)AKICreatureTestRemoveChild:(AKICreature *)child : (AKICreature *)creature;
- (void)AKICreatureTestBehavior:(AKICreature *)creature;

@end
