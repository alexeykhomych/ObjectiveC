//
//  AKISyntax.m
//  ObjectiveC
//
//  Created by Alexey Khomych on 04.06.16.
//  Copyright © 2016 Alexey Khomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#import "AKISyntax.h"

#pragma mark -
#pragma mark Private Declarations

static
void AutoreleasePoolLiteral();

static
void AutoreleasePoolExplicit();

#pragma mark -
#pragma mark Public Implementations

void AKISyntx() {
    @autoreleasepool {
        AutoreleasePoolLiteral();
        AutoreleasePoolExplicit();
    }
}

#pragma mark -
#pragma mark Private Declarations

void AutoreleasePoolLiteral() {
    @autoreleasepool {
        NSObject *object = [[NSObject new] autorelease];
        
        NSLog(@"NSAutoreleasePoolLiteral");
        NSLog(@"object = %@", object);
    }
}

void AutoreleasePoolExplicit() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NSObject *object = [[NSObject new] autorelease];
}

void ObjCMessaging() {
    id object = [[NSObject new] autorelease];
    object = [NSMutableArray arrayWithObjects:object, [[NSObject new] autorelease], nil];
    
    object = [NSMutableDictionary dictionary];
    [object setObject:([[NSObject new] autorelease]) forKey:[[[NSString alloc]initWithFormat:@"%d", arc4random()] autorelease]];
    
    SEL selector = @selector(setObject:forKey:);
    
    [object performSelector:selector
                withObject:[[NSObject new] autorelease]
                withObject:[[[NSString alloc] initWithFormat:@"%d", arc4random()] autorelease]];
 
//    ((void(*)(id, SEL, id, id))objc_msgSend)(object, selector, [[NSObject new] autorelease], [[[NSString alloc] initWithFormat:@"%d", arc4random()] autorelease]);
    
}