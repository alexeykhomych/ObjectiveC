//
//  NSArray+NSArray_AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 07.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSArray+NSArray_AKIExtensions.h"

@implementation NSArray (NSArray_AKIExtensions)

- (NSArray *)filterWithBlock:(ArrayFilterBlock)block {
    if (!block) {
        return self;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) { return block(evaluatedObject); }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

@end
