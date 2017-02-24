//
//  LZHAddGesterForAround.m
//  Liankeji
//
//  Created by mac on 2017/2/24.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LZHAddGesterForAround.h"

@implementation LZHAddGesterForAround

+(instancetype)init:(UIView*)targetView
{
    LZHAddGesterForAround *aroundGester = [[LZHAddGesterForAround alloc]init];
    if (aroundGester) {
        UIPanGestureRecognizer *gester = [[UIPanGestureRecognizer alloc]init];
        [targetView addGestureRecognizer:gester];
        targetView.edgeFillColor = [UIColor grayColor];
        [targetView addEdgeEffect];
    }
    return aroundGester;
}



@end
