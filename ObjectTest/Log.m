//
//  Log.c
//  ObjectTest
//
//  Created by 주영 이 on 2013. 12. 10..
//  Copyright (c) 2013년 uptown. All rights reserved.
//

#import "Log.h"

void Log (NSString *format, ...) {
    va_list args;
    va_start(args, format);
    fputs([[[NSString alloc] initWithFormat:format arguments:args] UTF8String], stdout);
    fputs("\n", stdout);
    va_end(args);
}
