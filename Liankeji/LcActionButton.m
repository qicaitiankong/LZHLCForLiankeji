//
//  LcActionButton.m
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcActionButton.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LcActionButton

- (instancetype)initWithFrame:(CGRect)frame andNum:(NSInteger)num{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createActionView:num];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createActionView:(NSInteger)num{

    self.backgroundColor = [UIColor whiteColor];
    //添加视图
    self.selectImageView = [[UIImageView alloc]init];
    self.selectImageView.hidden = YES;
    [self addSubview:self.selectImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.nameLabel];
    
    self.picImageView = [[UIImageView alloc]init];
    [self addSubview:self.picImageView];
    
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.textAlignment = NSTextAlignmentCenter;
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.priceLabel];
    
    //开始布局
    WS(ws);
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.mas_top).offset(5);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.6);
        make.height.mas_equalTo(ws.mas_height).multipliedBy(0.25);
    }];
    [self.selectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.nameLabel.mas_left);
        make.centerY.mas_equalTo(ws.nameLabel.mas_centerY);
        make.height.width.mas_equalTo(ws.nameLabel.mas_height).multipliedBy(0.7);
    }];
    switch (num) {
        case 0:
        {
            [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.nameLabel.mas_bottom);
                make.centerX.mas_equalTo(ws.mas_centerX);
                make.width.mas_equalTo(ws).multipliedBy(0.28);
                make.height.mas_equalTo(ws).multipliedBy(0.25);
            }];
        }
            break;
        case 1:
        {
            [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.nameLabel.mas_bottom);
                make.centerX.mas_equalTo(ws.mas_centerX);
                make.width.mas_equalTo(ws).multipliedBy(0.29);
                make.height.mas_equalTo(ws).multipliedBy(0.19);
            }];
        }
            break;
        case 2:
        {
            [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(ws.nameLabel.mas_bottom);
                make.centerX.mas_equalTo(ws.mas_centerX);
                make.width.mas_equalTo(ws).multipliedBy(0.24);
                make.height.mas_equalTo(ws).multipliedBy(0.21);
            }];
        }
            break;
        default:
            break;
    }
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.picImageView.mas_bottom);
        make.centerX.mas_equalTo(ws.picImageView);
        make.height.mas_equalTo(ws.mas_height).multipliedBy(0.3);
        make.width.mas_equalTo(ws).multipliedBy(0.6);
    }];
}





@end
