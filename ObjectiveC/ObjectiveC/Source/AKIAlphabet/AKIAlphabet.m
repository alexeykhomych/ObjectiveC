//
//  AKIAlphabet.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIAlphabet.h"

#import <math.h>

#import "AKIRangeAlphabet.h"
#import "AKIClusterAlphabet.h"
#import "AKIStringsAlphabet.h"

#import "NSString+AKIExtensions.h"

NSRange AKIMakeAlphabetRange(unichar value1, unichar value2) {
    unichar minValue = MIN(value1, value2);
    unichar maxValue = MAX(value1, value2);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

@implementation AKIAlphabet

//@dynamic count;

#pragma mark -	
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[AKIAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithStrings:(NSArray *)array {
    return [[[AKIAlphabet alloc] initWithStrings:array] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[AKIAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [[[AKIAlphabet alloc] initWithSymbols:string] autorelease];
}

+ (id)alphanumericAlphabet {
    return [[AKIAlphabet alloc] initWithAlphabets:@[[AKIAlphabet numericAlphabet], [AKIAlphabet letterAlphabet]]];
    
}

+ (id)numericAlphabet {
    return [AKIAlphabet alphabetWithUnicodeRange:NSMakeRange('0',
                                                             '9' - '0')];
}

+ (id)lowercaseLetterAlphabet {
    return [AKIAlphabet alphabetWithUnicodeRange:NSMakeRange('a',
                                                      'z' - 'a')];
}

+ (id)capitalizedLetterAlphabet {
    return [AKIAlphabet alphabetWithUnicodeRange:NSMakeRange('A',
                                                      'Z' - 'A')];
}

+ (id)letterAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitalizedLetterAlphabet]];
    
    return [NSString stringWithString:result];
}
            
+ (id)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    
    for (unichar i = range.location; i < NSMaxRange(range); i++) {
        [result appendFormat:@"%c", i];
    }
    
    return [NSString stringWithString:result];
}


#pragma mark -
#pragma mark Initializations and Dealocations

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[AKIRangeAlphabet alloc] initWithRange:range];;
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[AKIClusterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[AKIStringsAlphabet alloc] initWithStrings:strings];
}

- (instancetype)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

#pragma mark -
#pragma mark Public Methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}
- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                    objects:(id [])stackbuf
                                    count:(NSUInteger)resultLength
{    
    state->mutationsPtr = (unsigned long *)self;
    NSUInteger length = MIN(state->state + resultLength, [self count]);
    resultLength = length - state->state;
    
    
    if (resultLength) {
        for(NSUInteger i = 0; i < resultLength; i++) {
            stackbuf[i] = self[i + state->state];
        }
    }
    
    state->itemsPtr = stackbuf;
    state->state += resultLength;
    
    return resultLength;
}

@end
