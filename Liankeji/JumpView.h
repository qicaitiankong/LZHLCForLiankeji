//
//  JumpView.h
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>


//创建协议
@protocol JumpViewPassMessageDelegate <NSObject>

//传递当前点击的button
-(void)acitonOpen:(UIButton *)button;
//删除视图
-(void)remove;

@end



@interface JumpView : UIView

//代理->需要用weak以避免循环引用
@property (nonatomic,weak)id<JumpViewPassMessageDelegate>jumpDelegate;
//初始化方法
-(instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray andImageArray:(NSArray *)imageArray;

@end
