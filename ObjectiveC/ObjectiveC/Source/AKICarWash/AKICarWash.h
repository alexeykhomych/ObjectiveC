//
//  AKICarWash.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIBuilding.h"
#import "AKIWasher.h"
#import "AKICar.h"

@interface AKICarWash : NSObject
@property (nonatomic, readonly, getter=isEmptyQueue) BOOL emptyQueue;

- (void)washCar:(AKICar *)car;

@end
