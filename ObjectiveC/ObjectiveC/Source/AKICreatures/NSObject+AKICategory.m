//
//  NSObject+AKICategory.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSObject+AKICategory.h"

@implementation NSObject (AKICategory)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
