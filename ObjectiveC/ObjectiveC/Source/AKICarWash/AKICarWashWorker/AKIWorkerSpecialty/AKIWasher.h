//
//  AKIWasher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWorker.h"

@interface AKIWasher : AKIWorker

- (void)doJob:(NSInteger)money;
- (void)takeCar;
- (void)washCar;
- (void)giveCar;

@end
