//
//  AKICreature.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKICreature.h"

@interface AKICreature()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation AKICreature

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    [self setMutableChildren:nil];
    [self setName:nil];

    [super dealloc];
}

+ (instancetype)creature {
    AKICreature *creature = [[[super alloc] init] autorelease];
    creature.mutableChildren = [NSMutableArray object];
    
    return creature;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}

- (void)setAge:(NSUInteger)age {
    _age = age;
}

- (void)setWeight:(NSUInteger)weight {
    _weight = weight;
}

- (void)sayPhrase:(NSString *)sentence {
    NSLog(@"%@ say: %@", self, sentence);
    
    for (AKICreature *child in _mutableChildren) {
        [child sayPhrase:sentence];
    }
}

- (void)addChild:(AKICreature *)creature {
    NSMutableArray *childrenCopy = _mutableChildren;
    
    if (![childrenCopy containsObject:creature]) {
        [childrenCopy addObject:creature];
    }
}

- (void)removeChild:(AKICreature *)creature {
    [self.mutableChildren removeObject:creature];
}

- (void)performGenderSpecificOperation {
    NSLog(@"ti popal");
}

@end
