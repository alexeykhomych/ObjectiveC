//
//  AKIClusterAlphabet.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIClusterAlphabet.h"

@interface AKIClusterAlphabet ()
@property (nonatomic, retain) NSArray       *alphabets;
@property (nonatomic, assign) NSUInteger    count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation AKIClusterAlphabet

@synthesize count = _count;

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    self.alphabets = alphabets;
    self.count = [self countWithAlphabets:alphabets];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteratedIndex = index;
    
    NSAssert(index < count, NSRangeException);
    
    for (AKIAlphabet *alphabet in self.alphabets) {
        count = [alphabet count];
        
        if (iteratedIndex < count) {
            return alphabet[iteratedIndex];
        }
    
        iteratedIndex -= count;
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    
    for (AKIAlphabet *alphabet in self.alphabets) {
        [string appendString:[alphabet string]];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark Private Methods

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger count = 0;
    for (AKIAlphabet *alphabet in self.alphabets) {
        count += [alphabet count];;
    }
    
    return count;
}

@end
