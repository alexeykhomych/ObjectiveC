//
//  AKIBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIOffice.h"
#import "AKIWorker.h"

@interface AKIBuilding : NSObject
@property (nonatomic, copy, readonly) NSArray *offices;

- (void)addOffice:(AKIOffice *)office;
- (void)removeOffice:(AKIOffice *)office;

- (BOOL)addWorker:(AKIWorker *)worker;
- (void)removeWorker:(AKIWorker *)worker;

@end
