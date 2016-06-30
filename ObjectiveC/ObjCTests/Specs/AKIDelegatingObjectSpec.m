//
//  AKIDelegatingObjectSpec.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 30.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import "Kiwi.h"

#import "AKIDelegatingObject.h"
#import "AKIDelegate.h"

SPEC_BEGIN(AKIDelegatingObjectSpec)

describe(@"AKIDelegatingObject", ^{
    __block AKIDelegatingObject *delegatingObject = nil;
    
    beforeAll(^{
        delegatingObject = [AKIDelegatingObject new];
    });
    
    context(@"when setting state to 1", ^{
        __block AKIDelegate *delegate = nil;
        
        beforeEach(^{
            delegate = [AKIDelegate new];
            
            delegatingObject.delegate = delegate;
        });
        
        afterEach(^{
            [delegate clearStubs];
        });
        context(@"when delegate responds YES to -delegatingObjectShouldChangeState", ^{
            it(@"should receive -delegatingObject:didChangeState:", ^{
                [[delegate should] receive:@selector(delegatingObject:didChangeState:)];
                
                delegatingObject.state = 1;
            });
        });
        
        context(@"when delegate responds NO to -delegatingObjectShouldChangeState", ^{
            beforeAll(^{
                [delegate stub:@selector(delegatingObjectShouldChangeState:) andReturn:theValue(NO)];
                
                delegatingObject.delegate = delegate;
            });
            
            it(@"should't receive -delegatingObject:didChangeState:", ^{
                [[delegate shouldNot] receive:@selector(delegatingObject:didChangeState:)];
                
                delegatingObject.state = 1;
            });
        });
        
        context(@"when delegate doesn't respond to -delegatingObjectShouldChangeState", ^{
            beforeAll(^{
                delegate = [NSObject mock];
                delegatingObject.delegate = delegate;
                [delegate stub:@selector(delegatingObject:didChangeState:)];
            });
            
            it(@"should't receive -delegatingObject:didChangeState:", ^{
                [[delegate should] receive:@selector(delegatingObject:didChangeState:)];
                
                delegatingObject.state = 1;
            });
        });
    });
});

SPEC_END
