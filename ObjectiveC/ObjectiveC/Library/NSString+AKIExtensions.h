//
//  NSString+AKIExtensions.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 24.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AKIExtensions)

+ (NSString *)randomString;
+ (NSString *)randomStringWithLength:(NSUInteger)length;
+ (NSString *)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

- (NSArray *)symbols;

@end
