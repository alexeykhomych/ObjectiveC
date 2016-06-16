//
//  AKIMoney.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 16.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AKIWorker.h"

@protocol AKIMoney <NSObject>

- (void)giveMoneyToWorker:(AKIWorker *)worker;

@end

@interface AKIMoney : NSObject

@end
