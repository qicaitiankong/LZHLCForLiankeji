//
//  PromptView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PromptView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation PromptView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createPromptView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createPromptView{

    self.backgroundColor = [UIColor whiteColor];
    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    [self addSubview:self.picImageView];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.text = @"通过文字 视频 电话 来进行咨询";
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    self.contentLabel.textColor = RGBA(56, 56, 56, 0.7);
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.contentLabel];
    
    //开始布局
    WS(ws);
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).with.offset(5);
        make.centerY.mas_equalTo(ws);
        make.width.height.mas_equalTo(ws.mas_height).multipliedBy(0.6);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.picImageView.mas_right).with.offset(5);
        make.centerY.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.8);
        make.right.mas_equalTo(ws.mas_right);
    }];
    
    
}

@end
