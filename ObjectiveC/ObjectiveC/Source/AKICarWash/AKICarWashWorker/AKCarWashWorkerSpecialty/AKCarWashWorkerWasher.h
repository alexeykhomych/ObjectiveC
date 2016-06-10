//
//  AKCarWashWorkerWasher.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKICarWashWorker.h"

@interface AKCarWashWorkerWasher : AKICarWashWorker

- (void)takeCar;
- (void)washCar;
- (void)takeMoney:(NSInteger)money;
- (void)giveMoney:(AKICarWashWorker *)worker;
- (void)giveCar;

@end
