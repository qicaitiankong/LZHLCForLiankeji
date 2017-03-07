//
//  CacheTool.h
//  Liankeji
//
//  Created by liuchen on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheTool : NSObject

//计算单个文件的大小
+ (float)fileSizeAtPath:(NSString *)path;

//计算目录文件的大小
+ (float)folderSizeAtPath:(NSString *)path;

//清楚缓存
+ (void)clearCache:(NSString *)path;

@end
