//
//  NSArray+AKIExtensions.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 07.07.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSArray+AKIExtensions.h"
#import "NSObject+AKIExtensions.h"

@implementation NSArray (AKIExtensions)

+ (instancetype)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *objects = [NSMutableArray object];
    
    for (NSUInteger i = 0; i < count; i++) {
        [objects addObject:block()];
    }
    
    return [self arrayWithArray:objects];
}

- (NSArray *)filterWithBlock:(AKIArrayFilterBlock)block {
    if (!block) {
        return self;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) { return block(evaluatedObject); }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

@end
