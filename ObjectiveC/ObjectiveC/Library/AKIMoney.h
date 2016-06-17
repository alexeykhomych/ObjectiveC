//
//  AKIMoney.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 16.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AKIMoney <NSObject>
@property (nonatomic, assign) NSUInteger money;

@optional
- (void)takeMoney:(id)object;

@optional
- (NSUInteger)giveMoney;

@end
