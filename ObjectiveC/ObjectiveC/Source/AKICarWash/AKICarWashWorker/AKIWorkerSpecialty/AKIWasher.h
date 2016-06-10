//
//  AKIWasher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWorker.h"

@interface AKIWasher : AKIWorker
- (void)takeCar;
- (void)washCar;
- (void)takeMoney:(NSInteger)money;
- (void)giveMoneyToWorker:(AKIWorker *)worker;
- (void)giveCar;

@end
