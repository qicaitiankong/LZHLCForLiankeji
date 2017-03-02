//
//  LcPersonalHeaderView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcPersonalHeaderView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LcPersonalHeaderView

- (instancetype)initWithFrame:(CGRect)frame andDic:(NSDictionary *)dic{

    self = [super initWithFrame:frame];
    if (self) {
        //判断dic是否为空
        if (dic==nil) {
            //创建视图
            [self createPersonHeaderView:dic];
        }
    }
    return self;
}


#pragma mark - 创建视图
- (void)createPersonHeaderView:(NSDictionary *)dic{

    //添加子视图
    WS(ws);
    //添加底层视图布局
    self.backgroundColor = RGBA(0, 177, 251, 1);
    //添加子视图
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton.imageView setImage:[UIImage imageNamed:@""]];
    [self.backButton setTintColor:[UIColor whiteColor]];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:self.backButton];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.text = @"个人详情";
    self.tLabel.textColor = [UIColor whiteColor];
    self.tLabel.textAlignment = NSTextAlignmentCenter;
    self.tLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.tLabel];
    
    self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //[self.searchButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.searchButton setImage:[UIImage imageNamed:@"nav2.png"] forState:UIControlStateNormal];
    [self.searchButton setTintColor:[UIColor whiteColor]];
    [self.searchButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:self.searchButton];
    
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
    self.picImageView.layer.masksToBounds = YES;
//    //添加值观察机制
//    [self.picImageView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionOld context:nil];
    //这里才是实现圆形的地方
    self.picImageView.layer.cornerRadius = self.frame.size.height*0.35 / 2;
    //这里设置超出部分自动剪裁掉
    self.picImageView.clipsToBounds = YES;
    [self addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"年度最有影响力的大咖";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.nameLabel];
    
    //添加布局
    //添加布局
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws).with.offset(STATUSBAR_HEIGHT);
        make.left.mas_equalTo(ws).with.offset(5);
        make.width.height.mas_equalTo(ws).multipliedBy(0.15);
    }];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.backButton);
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(ws.backButton);
        make.width.mas_equalTo(ws).multipliedBy(0.3);
    }];
    
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.width.mas_equalTo(ws.backButton);
        make.right.mas_equalTo(ws.mas_right).with.offset(-5);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.tLabel.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(ws);
        make.height.width.mas_equalTo(ws.mas_height).multipliedBy(0.35);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws.picImageView.mas_bottom).with.offset(10);
        make.width.mas_equalTo(ws).multipliedBy(0.5);
        make.height.mas_equalTo(ws.tLabel);
    }];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//
//    //这里才是实现圆形的地方
//    self.picImageView.layer.cornerRadius = CGRectGetHeight(self.picImageView.bounds) / 2;
//    //这里设置超出部分自动剪裁掉
//    self.picImageView.clipsToBounds = YES;
//}







@end
