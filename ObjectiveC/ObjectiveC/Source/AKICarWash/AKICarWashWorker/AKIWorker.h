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
@property (nonatomic, assign)           NSUInteger  salary;
@property (nonatomic, assign)           NSUInteger  expirience;
@property (nonatomic, assign)           NSInteger   money;
@property (nonatomic, assign)           BOOL        isFree;
@property (nonatomic, assign)           AKIWorker   *chief;
@property (nonatomic, readonly, assign) AKIBuilding *workPlace;

+ (instancetype)worker;
- (void)doJob;
- (void)takeMoney:(NSInteger)money;
- (void)giveMoneyToWorker:(AKIWorker *)worker;
- (void)setWorkPlace:(AKIBuilding *)workPlace;
- (AKIBuilding *)getWorkPlace;

@end
