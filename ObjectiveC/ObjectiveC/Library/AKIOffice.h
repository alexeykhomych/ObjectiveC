//
//  AKIOffice.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 14.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKIOffice : NSObject

@property (nonatomic, readonly) NSUInteger  officesCount;
@property (nonatomic, readonly) NSUInteger  officeNumber;
@property (nonatomic, readonly) NSArray     *workersInOffice;
@property (nonatomic, readonly) NSArray     *offices;
@property (nonatomic, readonly) NSArray     *floor;
@property (nonatomic, readonly) NSString    *name;

+ (instancetype)officeInitWithName:(NSString *)name;
- (void)addOffice:(AKIOffice *)office;
- (void)removeOffice:(AKIOffice *)office;
- (id)getOfficeByNumber:(NSUInteger)number;
- (id)getWorkersByOfficeNumber:(NSUInteger)number;

@end
