//
//  AKIMoney.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 16.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AKIMoney <NSObject>
@property (nonatomic, readonly) NSUInteger money;

- (void)receiveMoney:(NSUInteger)money;
- (void)giveMoney:(NSUInteger)money;

@optional

- (void)takeMoneyFromObject:(id<AKIMoney>)object;

@end
