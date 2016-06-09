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

- (void)dealloc {
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)initCreature {
    AKICreature *creature = [super init];
    _mutableChildren = [[NSMutableArray alloc] init];

    return creature;
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

- (void)sayAnything:(NSString *)sentence {
    NSLog(@"%@ say: %@", self, sentence);
    
    for (AKICreature *child in _mutableChildren) {
        NSLog(@"%@ say: %@", child, sentence);
    }
}

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (void)addChildToArray:(AKICreature *)creature {
    [_mutableChildren addObject:self];
}

- (void)removeChildFromArray:(AKICreature *)creature {
    [_mutableChildren removeObject:creature];
}

@end
