//
//  SingletonWorkers.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 16.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "SingletonWorkers.h"

@implementation SingletonWorkers

+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    
    return shared;
}

- (instancetype)initUniqueInstance {
    return [super init];
}

@end
