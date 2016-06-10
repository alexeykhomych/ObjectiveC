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
    _mutableChildren = [NSMutableArray array];
    
    return creature;
}

- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        
        _name = name;
        
        [_name retain];
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

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

- (void)addChild:(AKICreature *)creature {
    [self.mutableChildren addObject:creature];
}

- (void)removeChild:(AKICreature *)creature {
    [self.mutableChildren removeObject:creature];
}

@end
