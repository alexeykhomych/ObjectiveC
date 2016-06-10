//
//  AKICarWashWorker.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashWorker.h"

@implementation AKICarWashWorker

- (void)dealloc {
    [super dealloc];
}

- (instancetype)worker {
    return [[super init] autorelease];
}
- (void)work {
    NSLog(@"super work");
}
@end
