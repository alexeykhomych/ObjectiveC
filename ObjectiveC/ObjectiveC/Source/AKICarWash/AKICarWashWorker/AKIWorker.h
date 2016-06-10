//
//  AKIWorker.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIWorker : NSObject
@property (nonatomic, assign)   NSInteger salary;
@property (nonatomic, assign)   NSInteger expirience;
@property (nonatomic, assign)   NSInteger money;

+ (instancetype)worker;
- (void)doJob;
- (void)takeMoney:(NSInteger)money;
- (void)giveMoneyToWorker:(AKIWorker *)worker;

@end
