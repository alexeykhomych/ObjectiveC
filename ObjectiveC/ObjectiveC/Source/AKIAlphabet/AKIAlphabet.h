//
//  AKIAlphabet.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
NSRange AKIMakeAlphabetRange(unichar value1, unichar value2);

@interface AKIAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
+ (instancetype)alphabetWithSymbols:(NSString *)string;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithSymbols:(NSString *)string;

// the method should be overriden
- (NSUInteger)count;

// the method should be overriden
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

- (NSString *)string;

@end
