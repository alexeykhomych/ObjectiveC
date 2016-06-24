//
//  AKIBuilding.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 10.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIBuilding : NSObject
@property (nonatomic, copy, readonly) NSArray *offices;

- (void)addOffice:(id)office;
- (void)removeOffice:(id)office;

- (id)freeWorkerWithClass:(Class)cls;
- (id)freeOffice;

@end
