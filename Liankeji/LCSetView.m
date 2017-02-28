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
    self.picImageView.layer.cornerRadius = 33;
    self.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
    [self addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"不猜不猜就不猜";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.nameLabel];
    
    //开始布局
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws).with.offset(5);
        make.height.mas_equalTo(ws).multipliedBy(2.0/3.0);
        make.width.mas_equalTo(ws.picImageView.mas_height);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.picImageView.mas_centerX);
        make.bottom.mas_equalTo(ws);
        make.top.mas_equalTo(ws.picImageView.mas_bottom).with.offset(5);
        make.width.mas_equalTo(ws).multipliedBy(0.8);
    }];
    
}


@end
