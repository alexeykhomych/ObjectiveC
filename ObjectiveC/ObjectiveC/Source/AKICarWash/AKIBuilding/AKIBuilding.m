//
//  AKIBuilding.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIBuilding.h"
#import "NSObject+AKICategory.h"

@implementation AKIBuilding

#pragma mark -
#pragma mark Init/dealloc

- (void)dealloc {
//    self._offices = nil;
    [super dealloc];
}

+ (instancetype)building {
    AKIBuilding *building = [self object];
    
    return building;
}

#pragma mark -
#pragma mark Public Implementations

@end
