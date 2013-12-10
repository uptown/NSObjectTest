//
//  TTSmartObject.m
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#import "TTSmartObject.h"
#import "Log.h"

@implementation TTSmartObject{
    NSMutableDictionary *_dict;
}

- (id)init{
    if(self = [super init]){
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)initWithData:(NSDictionary *)dict{
    if(self = [super init]){
        _dict = [NSMutableDictionary dictionaryWithDictionary:dict];
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *selectorName = NSStringFromSelector(aSelector);
    NSUInteger colonIndex = [selectorName rangeOfString:@":"].location;
    if(colonIndex != NSNotFound){
        if([selectorName hasPrefix:@"set"]){
            aSelector = @selector(setObject:forKey:);
        }
        else{
            @throw [[NSException alloc] initWithName:@"잘못된 method 입니다요" reason:@"네네" userInfo:nil];
        }
    }
    else{
        aSelector = @selector(objectForKey:);
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    Log(@"%s:%@", __PRETTY_FUNCTION__, invocation);
    NSString *selectorName = NSStringFromSelector(invocation.selector);
    NSUInteger colonIndex = [selectorName rangeOfString:@":"].location;
    if(colonIndex != NSNotFound){
        if([selectorName hasPrefix:@"set"]){
            NSMutableString *propertyName = [NSMutableString stringWithString:selectorName];
            [propertyName deleteCharactersInRange:NSMakeRange(0, 3)];
            [propertyName deleteCharactersInRange:NSMakeRange(propertyName.length - 1, 1)];
            NSString *firstChar = [[propertyName substringWithRange:NSMakeRange(0,1)] lowercaseString];
            [propertyName replaceCharactersInRange:NSMakeRange(0, 1) withString:firstChar];
            
            [invocation setArgument:&propertyName atIndex:3];
            invocation.selector = @selector(setObject:forKey:);
            [invocation invokeWithTarget:self];
        }
        else{
            @throw [[NSException alloc] initWithName:@"잘못된 method 입니다요" reason:@"네네" userInfo:nil];
        }
    }
    else{
        [invocation setArgument:&selectorName atIndex:2];
        invocation.selector = @selector(objectForKey:);
        [invocation invokeWithTarget:self];
    }
}

- (id)objectForKey:(id<NSCopying>)key{
    Log(@"%s:%@", __PRETTY_FUNCTION__, key);
    return [_dict objectForKey:key];
}

- (void)setObject:(id)object forKey:(id<NSCopying>)aKey{
    Log(@"%s:%@:%@", __PRETTY_FUNCTION__, object, aKey);
    [_dict setObject:object forKey:aKey];
}


@end
