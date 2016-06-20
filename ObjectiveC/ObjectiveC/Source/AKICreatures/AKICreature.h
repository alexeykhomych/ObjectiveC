//
//  AKICreature.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+AKICategory.h"

@interface AKICreature : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSUInteger  weight;
@property (nonatomic, assign)   NSUInteger  age;
@property (nonatomic, readonly) NSArray     *children;

- (void)sayPhrase:(NSString *)sentence;
- (void)performGenderSpecificOperation;

- (void)addChild:(AKICreature *)creature;
- (void)removeChild:(AKICreature *)creature;

@end
