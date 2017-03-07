//
//  LcPersonalHeaderView.h
//  Liankeji
//
//  Created by liuchen on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LcPersonalHeaderView : UIView


@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *tLabel;
@property (nonatomic,strong) UIButton *searchButton;
@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *nameLabel;


- (instancetype)initWithFrame:(CGRect)frame andDic:(NSDictionary *)dic;


@end
