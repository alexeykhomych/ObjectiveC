//
//  AKIDirector.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "AKIWorker.h"

@interface AKIDirector : AKIWorker
@property (nonatomic, assign) NSInteger revenue;

- (void)makeRevenue:(NSInteger)money;

@end
