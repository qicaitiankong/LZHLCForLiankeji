//
//  LCSetView.m
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCSetView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LCSetView

#warning 有后台数据后需要改变后台数据->text和image为假数据;
- (instancetype)initWithFrame:(CGRect)frame andSource:(NSDictionary *)dic{
    
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createSetView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createSetView{
    
    WS(ws);
    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.layer.masksToBounds = YES;
    self.picImageView.layer.cornerRadius = 40;
    self.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
    [self addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"柳晨你真帅";
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.nameLabel];
    
    //开始布局
    CGFloat imageHeight = self.frame.size.height*2.0/3.0-10;
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws).multipliedBy(2.0/3.0);
        make.width.height.mas_equalTo(imageHeight);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.picImageView.mas_centerX);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(1.0/3.0);
        make.width.mas_equalTo(ws).multipliedBy(0.8);
    }];
    
}


@end
