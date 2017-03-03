//
//  lzhReturnLabelHeight.h
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//自动计算label高度

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface lzhReturnLabelHeight : NSObject

+(CGFloat)getLabelHeight:(NSString*)content fontSize:(CGFloat)fontSize width:(CGFloat)labelWidth;

@end
