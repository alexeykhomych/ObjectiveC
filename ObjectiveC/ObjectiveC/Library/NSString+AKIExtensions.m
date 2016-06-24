//
//  NSString+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSString+AKIExtensions.h"

static const NSUInteger kNSStringDefaultRandomStringLength = 30;

@implementation NSString (AKIExtensions)

+ (id)alphanumericAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self letterAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (id)numericAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('0',
                                                      '9' - '0' + 1)];
}

+ (id)lowercaseLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('a',
                                                      'z' - 'a' + 1)];
}

+ (id)capitaliedLetterAlphabet {
    return [self alphabetWithUnicodeRange:NSMakeRange('A',
                                                      'Z' - 'A' + 1)];
}

+ (id)letterAlphabet {
    NSMutableString *result = [NSMutableString stringWithString:[self lowercaseLetterAlphabet]];
    [result appendString:[self capitaliedLetterAlphabet]];
    
    return [self stringWithString:result];
}

+ (id)alphabetWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    
    for (unichar i = range.location; i < NSMaxRange(range); i++) {
        [result appendFormat:@"%c", i];
    }
    
    return [self stringWithString:result];
}

+ (id)randomString {
    return [self randomStringWithLength:arc4random_uniform(kNSStringDefaultRandomStringLength)];
}

+ (id)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[self alphanumericAlphabet]];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger alphabetLength = [alphabet length];
    
    for (NSUInteger i = 0; i < alphabetLength; i++) {
        unichar resultChar = [alphabet characterAtIndex:arc4random_uniform(((uint32_t)i))];
        [result appendFormat:@"%c", resultChar];
    }
    
    return [self stringWithString:result];
}

@end
