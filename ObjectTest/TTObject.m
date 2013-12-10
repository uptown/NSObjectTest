//
//  TTObject.m
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#import "TTObject.h"
#import "Log.h"

@implementation TTObject

- (id)testMethod:(id)testParam{
    Log(@"%s:%@", __PRETTY_FUNCTION__, testParam);
    return testParam;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    Log(@"%s:%@", __PRETTY_FUNCTION__, invocation);
    [super forwardInvocation:invocation];
}

- (BOOL)isProxy{
    Log(@"isProxy");
    return [super isProxy];
}

- (BOOL)isKindOfClass:(Class)aClass{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromClass(aClass));
    return [super isKindOfClass:aClass];
}
- (BOOL)isMemberOfClass:(Class)aClass{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromClass(aClass));
    return [super isMemberOfClass:aClass];
}
- (BOOL)conformsToProtocol:(Protocol *)aProtocol{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromProtocol(aProtocol));
    return [super conformsToProtocol:aProtocol];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super respondsToSelector:aSelector];
}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super instancesRespondToSelector:aSelector];
}

+ (BOOL)conformsToProtocol:(Protocol *)protocol{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromProtocol(protocol));
    return [super conformsToProtocol:protocol];
}
- (IMP)methodForSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super methodForSelector:aSelector];
}
+ (IMP)instanceMethodForSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super instanceMethodForSelector:aSelector];
}
- (void)doesNotRecognizeSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    [super doesNotRecognizeSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super methodSignatureForSelector:aSelector];
}

+ (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector{
    Log(@"%s:%@", __PRETTY_FUNCTION__, NSStringFromSelector(aSelector));
    return [super instanceMethodSignatureForSelector:aSelector];
}

@end
