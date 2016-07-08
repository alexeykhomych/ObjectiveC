//
//  NSArray+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 07.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSArray+AKIExtensions.h"

@implementation NSArray (AKIExtensions)

- (NSArray *)filterWithBlock:(AKIArrayFilterBlock)block {
    if (!block) {
        return self;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) { return block(evaluatedObject); }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

@end
