//
//  lzhFirstPageScienceDetaileCellHeader.h
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//科技圈详情cell头

#import <UIKit/UIKit.h>

@interface lzhFirstPageScienceDetaileCellHeader : UIView
//头像
@property (strong,nonatomic)UIButton *userImageButt;
//名字
@property (strong,nonatomic)UILabel *userNameLabel;
//时间
@property (strong,nonatomic)UILabel *userTimeLabel;
//内容
@property (strong,nonatomic)UILabel *contentLabel;

@property (strong,nonatomic)UILabel *commentNumberLabel;

@property (strong,nonatomic)UILabel *praiseNumberLabel;

- (instancetype)initWithFrame:(CGRect)frame delegate:(id)targetDelegate contentHeight:(CGFloat)labelContentHeight;


@end
