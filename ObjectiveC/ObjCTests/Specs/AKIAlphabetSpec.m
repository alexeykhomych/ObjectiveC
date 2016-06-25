//
//  AKIAlphabetSpec.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 25.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "Kiwi.h"

#import "AKIAlphabet.h"
#import "AKIClusterAlphabet.h"
#import "AKIRangeAlphabet.h"
#import "AKIStringsAlphabet.h"

SPEC_BEGIN(AKIAlphabetSpec)

describe(@"AKIAlphabet", ^{
    __block AKIAlphabet *alphabet = nil;
//    + (instancetype)alphabetWithRange:(NSRange)range;
//    + (instancetype)alphabetWithStrings:(NSArray *)array;
//    + (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;
//    + (instancetype)alphabetWithSymbols:(NSString *)string;
//    
//    - (instancetype)initWithRange:(NSRange)range;
//    - (instancetype)initWithAlphabets:(NSArray *)alphabets;
//    - (instancetype)initWithStrings:(NSArray *)strings;
//    - (instancetype)initWithSymbols:(NSString *)strings;
//    
//    - (NSUInteger)count;
//    - (NSString *)stringAtIndex:(NSUInteger)index;
//    - (NSString *)objectAtIndexedSubscript:(NSUInteger)index;
    
    context(@"when initialized with + (instancetype)alphabetWithRange: with range 'A' - 'B'", ^{
        
        
        beforeAll(^{
            alphabet = [AKIAlphabet alphabetWithRange:NSMakeRange('A', 'B' - 'A')];
        });
        
        afterAll(^{
            alphabet = nil;
        });
        
        it(@"should be of class AKIRangeAlphabet", ^{
            [[alphabet should] beKindOfClass:[AKIRangeAlphabet class]];
        });
        
        it(@"should be of count 2", ^{
            theValue([alphabet count]);
            [[alphabet should] haveCountOf:2];
        });
        
        it(@"should contain @\"A\" at index = 0", ^{
            [[[alphabet stringAtIndex:0] should] equal:@"A"];
        });
        
        it(@"should contain @\"B\" at index = 0", ^{
            [[alphabet[1] should] equal:@"B"];
        });
    });
});

SPEC_END
