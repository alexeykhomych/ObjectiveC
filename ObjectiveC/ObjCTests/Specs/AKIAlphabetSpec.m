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
    
    afterAll(^{
        alphabet = nil;
    });
    
    context(@"when initialized with + (instancetype)alphabetWithRange: with range 'A' - 'B'", ^{
        beforeAll(^{
            alphabet = [AKIAlphabet alphabetWithRange:AKIMakeAlphabetRange('A', 'B')];
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
        
        it(@"should contain @\"B\" at index = 1", ^{
            [[alphabet[1] should] equal:@"B"];
        });
        
        it(@"should raise, when requesting object at index 3", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:3];
            }) should] raise];
            
            [[theBlock(^{
                id a = alphabet[3];
                [a description];
            }) should] raise];
        });
        
        it(@"should return @\"AB\" from -string", ^{
            [[[alphabet string] should] equal:@"AB"];
        });
    });
    
    context(@"when initialized with - initWithRange: With range 'A'-'B'", ^{
        beforeAll(^{
            alphabet = [[AKIAlphabet alloc] initWithRange:AKIMakeAlphabetRange('A', 'B')];
        });
        
        it(@"should be of class AKIRangeAlphabet", ^{
            [[alphabet should] beKindOfClass:[AKIRangeAlphabet class]];
        });
        
    });
    
    context(@"when initialized with +initWithRange: with range 'A'-'z' when enumerated", ^{
        NSRange range = AKIMakeAlphabetRange('A', 'z');
        
        beforeAll(^{
            alphabet = [[AKIAlphabet alloc] initWithRange:range];
        });
        
        it(@"should's raise", ^{
            [[theBlock(^{
                for(id symbol in alphabet) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return count of symbols equal to 'A'-'z' range", ^{
            NSUInteger count = 0;
            for(NSString *symbol in alphabet) {
                [symbol description];
                count++;
            }
            
            [[theValue(count) should] equal:@(range.length)];
        });
        
        it(@"should return symbols in range 'A'-'z'", ^{
            unichar character = range.location;
            for(NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%c", character]];
                character++;
            }
        });
        
    });
    
    context(@"when initialized with +initWithStrings: with range @[@\"a\", @\"b\"", ^{
        beforeAll(^{
            alphabet = [[AKIAlphabet alloc] initWithStrings:@[@"a", @"b"]];
        });
        
        it(@"should be of AKIStringAlphabet", ^{
            [[alphabet should] beKindOfClass:[AKIStringsAlphabet class]];
        });
        
        it(@"should be of count 2", ^{
            [[alphabet should] haveCountOf:2];
        });
        
        it(@"should contain @\"a\" at index = 0", ^{
            [[[alphabet stringAtIndex:0] should] equal:@"a"];
        });
        
        it(@"should contain @\"b\" at index = 1", ^{
            [[alphabet[1] should] equal:@"b"];
        });
        
        it(@"should raise, when requesting object at index 3", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:3];
            }) shouldNot] raise];
            
            [[theBlock(^{
                id a = alphabet[3];
                [a description];
            }) shouldNot] raise];
        });
        
        it(@"should return  @\"ab\" from -string", ^{
            [[[alphabet string] should] equal:@"ab"];
        });
    });
    
    context(@"when initialized with +initWithStrings: with array containing 'A'-'z' when enumerated", ^{
        NSRange range = AKIMakeAlphabetRange('A', 'z');
        
        beforeAll(^{
            NSMutableArray *strings = [NSMutableArray new];
            for (unichar symbol = range.location; symbol < NSMaxRange(range); symbol++) {
                [strings addObject:[NSString stringWithFormat:@"%c", symbol]];
            }
            
            alphabet = [[AKIAlphabet alloc] initWithStrings:strings];
        });
        
        it(@"should's raise", ^{
            [[theBlock(^{
                for(id symbol in alphabet) {
                    [symbol description];
                }
            }) shouldNot] raise];
        });
        
        it(@"should return count of symbols equal to 'A'-'z' range", ^{
            NSUInteger count = 0;
            for(NSString *symbol in alphabet) {
                [symbol description];
                count++;
            }
            
            [[theValue(count) should] equal:@(range.length)];
        });
        
        it(@"should return symbols in range 'A'-'z'", ^{
            unichar character = range.location;
            for(NSString *symbol in alphabet) {
                [[symbol should] equal:[NSString stringWithFormat:@"%c", character]];
                character++;
            }
        });
        
    });

    context(@"when initialized with +alphabetWithAlphabets: with alphabets in range 'A'-'Z', 'a'-'z'", ^{
//        NSRange range = AKIMakeAlphabetRange('A', 'Z');
        
        AKIAlphabet *capitalizedAlphabet = [AKIAlphabet alphabetWithRange:AKIMakeAlphabetRange('A', 'Z')];
        AKIAlphabet *lowercaseAlphabet = [AKIAlphabet alphabetWithRange:AKIMakeAlphabetRange('a', 'z')];
        
        beforeAll(^{
            alphabet = [AKIAlphabet alphabetWithAlphabets:@[capitalizedAlphabet, lowercaseAlphabet]];
        });
        
        it(@"should be of AKIStringAlphabet", ^{
            [[alphabet should] beKindOfClass:[AKIStringsAlphabet class]];
        });
        
        it(@"should be of count 2", ^{
            [[alphabet should] haveCountOf:2];
        });
        
        it(@"should contain @\"a\" at index = 0", ^{
            [[[alphabet stringAtIndex:0] should] equal:@"a"];
        });
        
        it(@"should contain @\"b\" at index = 1", ^{
            [[alphabet[1] should] equal:@"b"];
        });
        
        it(@"should raise, when requesting object at index 3", ^{
            [[theBlock(^{
                [alphabet stringAtIndex:3];
            }) shouldNot] raise];
            
            [[theBlock(^{
                id a = alphabet[3];
                [a description];
            }) shouldNot] raise];
        });
        
        it(@"should return  @\"ab\" from -string", ^{
            [[[alphabet string] should] equal:@"ab"];
        });
    });
});

SPEC_END
