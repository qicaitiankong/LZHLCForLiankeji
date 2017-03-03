//
//  lzhReturnLabelHeight.m
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhReturnLabelHeight.h"
#import "GetCellHeight.h"

@implementation lzhReturnLabelHeight

+(CGFloat)getLabelHeight:(NSString*)content fontSize:(CGFloat)fontSize width:(CGFloat)labelWidth{
    CGFloat h = 0;
    lzhReturnLabelHeight *selfClass = [[lzhReturnLabelHeight alloc]init];
    if(selfClass){
        UILabel *modelLabel = [[UILabel alloc]init];
        modelLabel.font = [UIFont systemFontOfSize:fontSize];
        h =  [[GetCellHeight ShareCellHeight] cellHeight:modelLabel content:content Cellwidth:labelWidth];
        return h;
    }
    return h;
}

@end
