//
//  AKIBox.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIOffice.h"
#import "AKIWasher.h"
#import "AKICar.h"

@interface AKIBox : AKIOffice
@property (nonatomic, copy, readonly) NSArray *cars;

- (void)addCar:(AKICar *)car;
- (void)removeCar:(AKICar *)car;

@end
