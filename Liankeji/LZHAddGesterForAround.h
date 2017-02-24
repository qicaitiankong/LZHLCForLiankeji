//
//  LZHAddGesterForAround.h
//  Liankeji
//
//  Created by mac on 2017/2/24.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.

//为了使用手势已经做了设置：Project - Build Settings - ENABLE_STRICT_OBJC_MSGSEND=NO
//后期出现其他问题，注意此处

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+EdgeAnimation.h"


@interface LZHAddGesterForAround : NSObject
//目标view（要添加手势的view）
+(instancetype)init:(UIView*)targetView;

@end
