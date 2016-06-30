//
//  NSString+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIExtensions.h"
#import "AKIAlphabet.h"

static const NSUInteger kNSStringDefaultRandomStringLength = 30;

@implementation NSString (AKIExtensions)

+ (id)randomString {
    return [self randomStringWithLength:arc4random_uniform(kNSStringDefaultRandomStringLength)];
}

+ (id)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[AKIAlphabet alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger i = 0; i < alphabetLength; i++) {
        unichar resultChar = [alphabet characterAtIndex:arc4random_uniform((u_int32_t)alphabetLength)];
        [result appendFormat:@"%c", resultChar];
    }
    
    return [self stringWithString:result];
}

- (NSArray *)symbols {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self length]];
    NSUInteger alphabetLength = [self length];
    
    for (NSUInteger i = 0; i < alphabetLength; i++) {
        unichar resultChar = [self characterAtIndex:i];
        [result addObject:[NSString stringWithFormat:@"%c", resultChar]];
    }
    
    return [[result copy] autorelease];
}

@end
