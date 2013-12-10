//
//  main.m
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#include <CoreFoundation/CoreFoundation.h>
#import "TTObject.h"
#import "TTSmartObject.h"
#import "Log.h"

int main(int argc, const char * argv[])
{
    TTObject* ttObject = [[TTObject alloc] init];
    Log(@"\nTTObject");
    Log(@"%@", ttObject.testProperty);
    ttObject.testProperty = @2;
    Log(@"%@", ttObject.testProperty);
    Log(@"%@", [ttObject testMethod:@1]);
    
    Log(@"\nTTObject with TTFakeObject Interface");
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttObject;
        Log(@"%@", fakeObject.fakeProperty);
    }
    @catch (NSException * e) {
    }
    
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttObject;
        fakeObject.fakeProperty = @2;
    }
    @catch (NSException * e) {
    }
    
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttObject;
        [fakeObject fakeMethod:@1];
    }
    @catch (NSException * e) {
    }
    
    Log(@"\nTTSmartObject");
    TTSmartObject* ttSmartObject = [[TTSmartObject alloc] init];
    Log(@"%@", ttSmartObject.testProperty);
    ttSmartObject.testProperty = @2;
    Log(@"%@", ttSmartObject.testProperty);
    Log(@"%@", [ttSmartObject testMethod:@1]);
    
    
    Log(@"\nTTSmartObject with TTFakeObject Interface");
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttSmartObject;
        Log(@"%@", fakeObject.fakeProperty);
    }
    @catch (NSException * e) {
    }
    
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttSmartObject;
        fakeObject.fakeProperty = @2;
        Log(@"%@", fakeObject.fakeProperty);
    }
    @catch (NSException * e) {
    }
    
    @try {
        TTFakeObject *fakeObject = (TTFakeObject *)ttSmartObject;
        [fakeObject fakeMethod:@1];
    }
    @catch (NSException * e) {
        Log(@"%@", e.name);
    }
    
    
}

