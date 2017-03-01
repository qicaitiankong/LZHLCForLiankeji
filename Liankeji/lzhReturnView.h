//
//  lzhReturnView.h
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//自定义返回view

#import <UIKit/UIKit.h>
typedef void (^SearchBlock)();

@interface lzhReturnView : UIView

@property (strong,nonatomic) UIButton *ownButt;
@property (strong,nonatomic) UILabel *ownTitleLabel;
//后期添加搜索button
@property (nonatomic,strong) UIButton *lcSearchButton;
@property (nonatomic,weak)  SearchBlock lcserachBlock;

@end
