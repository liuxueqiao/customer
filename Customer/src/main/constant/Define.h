//
//  Define.h
//  Customer
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020 qiao. All rights reserved.
//

#ifndef Define_h
#define Define_h

#if DEBUG
    #define NSDebugLog(FORMAT, ...) fprintf(stderr,"\n\n打印时间:  %s\n打印位置:  %s  第%d行\n内容详情:  %s\n\n\n",[[[NSDate date] description] UTF8String],[[[NSString stringWithUTF8String:__FILE__]  lastPathComponent] UTF8String], __LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define MTLog(str, ...)  [iConsole log:@"文件路径：%s(第%d行):\n " str, __FILE__, __LINE__, ##__VA_ARGS__]
#else
    #define NSDebugLog(...)
#endif


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


#endif /* Define_h */
