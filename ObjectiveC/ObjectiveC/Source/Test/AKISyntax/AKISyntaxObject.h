//
//  AKISyntaxObject.h
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKISyntaxObject : NSObject {
    @public
    NSObject *_publicObject;
    
    @private
    NSObject *_privateObject;
    
    @protected
    NSObject *_protectedObject;
}

- (void)sayHi;
- (id)text;
//-(NSString *)text;
- (void)sayWithString:(NSString *)string;
- (void)sayWithString:(NSString *)string name:(NSString *)name;

@property (nonatomic, retain) NSObject *object;
@property (nonatomic, copy) NSObject *atomicCopyObject;
@property (nonatomic, assign) NSInteger integerValue;
@property (nonatomic, assign, readwrite, getter=isReady, setter=setIsReady:) BOOL ready;

@end

@class AKISyntax;
@interface AKISyntax : NSObject <NSObject> {
    NSObject *_publicObject;
}
