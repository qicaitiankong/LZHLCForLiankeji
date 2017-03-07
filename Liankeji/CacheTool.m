//
//  CacheTool.m
//  Liankeji
//
//  Created by liuchen on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "CacheTool.h"
#import "SDImageCache.h"

@implementation CacheTool

#pragma mark - 计算单个文件的大小
+ (float)fileSizeAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

#pragma mark - 计算目录大小
+ (float)folderSizeAtPath:(NSString *)path {
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeAtPath:absolutePath];
        }
        //SDWebImage框架自身计算缓存的实现
        folderSize += [[SDImageCache sharedImageCache] getSize] /1024.0/1024.0;
        // NSLog(@"%.2f", folderSize);
        return folderSize;
    }
    return 0;
}

#pragma mark - 清楚缓存
+(void)clearCache:(NSString *)path{
    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    cachePath=[cachePath stringByAppendingPathComponent:path];
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:cachePath]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:cachePath];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *fileAbsolutePath=[cachePath stringByAppendingPathComponent:fileName];
            NSLog(@"fileAbsolutePath=%@",fileAbsolutePath);
            [fileManager removeItemAtPath:fileAbsolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];
}






@end
