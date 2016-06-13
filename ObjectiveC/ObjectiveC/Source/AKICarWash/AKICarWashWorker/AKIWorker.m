//
//  AKIWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "NSObject+AKICategory.h"
#import "AKIWorker.h"

@implementation AKIWorker

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
    _isFree = YES;
    [super dealloc];
}

+ (instancetype)worker {
    AKIWorker *worker = [[[super alloc] init] autorelease];
    worker.workPlace = [AKIBuilding object];
    worker.isFree = YES;
    return worker;
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

- (void)setWorkPlace:(AKIBuilding *)workPlace {
    
}

@end
