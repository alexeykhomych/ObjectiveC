//
//  AKIBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIOffice.h"

@interface AKIBuilding : NSObject
@property (nonatomic, assign, getter=isFull)    BOOL        full;

+ (instancetype)building;

@end
