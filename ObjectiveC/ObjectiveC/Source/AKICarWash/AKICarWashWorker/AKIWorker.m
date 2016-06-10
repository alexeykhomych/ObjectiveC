//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWorker.h"

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    [super dealloc];
}

+ (instancetype)worker {
    return [[super init] autorelease];
}

#pragma mark -
#pragma mark Public Implementations

- (void)work {
    NSLog(@"super work");
}

- (void)takeMoney:(NSInteger)money {
    
}

- (void)giveMoneyToWorker:(AKIWorker *)worker {
    
}

- (void)doJob {
    
}

@end
