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
    self.mutableChildren = nil;
    self.name = nil;

    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    self.mutableChildren = [NSMutableArray object];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)sayPhrase:(NSString *)sentence {
    NSLog(@"%@ say: %@", self, sentence);
    
    for (AKICreature *child in self.mutableChildren) {
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
