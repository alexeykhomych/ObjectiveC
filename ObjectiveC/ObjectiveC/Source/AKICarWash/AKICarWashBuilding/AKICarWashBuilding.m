//
//  AKICarWashBuilding.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashBuilding.h"
#import "NSObject+AKICategory.h"

@implementation AKICarWashBuilding

- (void)dealloc {
    [super dealloc];
}

- (instancetype)building {
    return [[super init] autorelease];
}

- (void)room {
    NSLog(@"ti popal");
}

@end
