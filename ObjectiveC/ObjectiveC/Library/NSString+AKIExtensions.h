//
//  NSString+AKIExtensions.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AKIExtensions)

// english
+ (id)alphanumericAlphabet;

// arabian
+ (id)numericAlphabet;

// english
+ (id)lowercaseLetterAlphabet;

// english
+ (id)capitaliedLetterAlphabet;

// english
+ (id)letterAlphabet;

+ (id)alphabetWithUnicodeRange:(NSRange)range;

+ (NSString *)randomString;
+ (NSString *)randomStringWithLength:(NSUInteger)length;
+ (NSString *)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

- (NSArray *)symbols;

@end
