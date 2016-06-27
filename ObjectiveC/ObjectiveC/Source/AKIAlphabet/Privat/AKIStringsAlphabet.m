//
//  AKIStringsAlphabet.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIStringsAlphabet.h"
@interface AKIStringsAlphabet ()
@property (nonatomic, retain) NSArray *strings;

@end

@implementation AKIStringsAlphabet

#pragma mark -
#pragma mark Initializations and Dealocations

- (void)dealloc {
    self.strings = nil;
    
    [super dealloc];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    self = [super init];
    self.strings = strings;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    return [self.strings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id [])stackbuf
                                    count:(NSUInteger)resultLength
{
    return [self.strings countByEnumeratingWithState:state
                                             objects:stackbuf
                                               count:resultLength];
}

@end
