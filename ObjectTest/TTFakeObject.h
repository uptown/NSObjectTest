//
//  TTFakeObject.h
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#ifndef ObjectTest_TTFakeObject_h
#define ObjectTest_TTFakeObject_h

#import <Foundation/Foundation.h>

@interface TTFakeObject : NSObject
@property (nonatomic, strong) id fakeProperty;
- (id)fakeMethod:(id)testParam;
@end

#endif
