//
//  AKICarWashBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "AKICarWashWorker.h"

@interface AKICarWashBuilding : NSObject

@property (nonatomic, assign)NSInteger count; //people count

- (instancetype)building;
- (void)room;

@end
