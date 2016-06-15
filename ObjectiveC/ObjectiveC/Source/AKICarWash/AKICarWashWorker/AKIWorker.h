//
//  AKIWorker.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIBuilding.h"

@interface AKIWorker : NSObject
@property (nonatomic, assign)                   NSUInteger  salary;
@property (nonatomic, assign)                   NSUInteger  experience;
@property (nonatomic, assign)                   NSInteger   money;
@property (nonatomic, assign, getter=isFree)    BOOL        free;
@property (nonatomic, assign)                   AKIWorker   *chief;

+ (instancetype)worker;

- (void)doJob;
- (void)takeMoney:(NSInteger)money;

@end
