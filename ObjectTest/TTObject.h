//
//  TTObject.h
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTFakeObject.h"

@interface TTObject : NSObject
@property (nonatomic, strong) id testProperty;

- (id)testMethod:(id)testParam;
@end
