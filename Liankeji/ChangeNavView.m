//
//  ChangeNavView.m
//  Liankeji
//
//  Created by liuchen on 2017/2/28.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ChangeNavView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation ChangeNavView

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{

    self = [super initWithFrame:frame];
    if (self) {
        //添加数据
        self.changeText = title;
        //添加视图
        [self createChangeView];
    }
    return self;
}

#pragma mark - 添加视图
- (void)createChangeView{

    WS(ws);
    //添加底层视图布局
    self.backgroundColor = RGBA(0, 177, 251, 1);
    //添加子视图
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //[self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"WechatIMG.png"] forState:UIControlStateNormal];
    [self.backButton setTintColor:[UIColor whiteColor]];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:self.backButton];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.text = self.changeText;
    self.tLabel.textColor = [UIColor whiteColor];
    self.tLabel.textAlignment = NSTextAlignmentCenter;
    self.tLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:self.tLabel];
    

    
    self.preservationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.preservationButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.preservationButton.titleLabel setTextAlignment:NSTextAlignmentRight];
    [self.preservationButton setTintColor:[UIColor whiteColor]];
    [self.preservationButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:self.preservationButton];
    
    //添加布局
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws).with.offset(10);
        make.height.mas_equalTo(ws).multipliedBy(0.5);
        make.width.mas_equalTo(ws.mas_height).multipliedBy(0.5);
    }];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.8);
        make.width.mas_equalTo(ws).multipliedBy(0.3);
    }];
    
    [self.preservationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws.mas_right).with.offset(-10);
        make.height.mas_equalTo(ws).multipliedBy(0.7);
        make.width.mas_equalTo(ws.mas_height).multipliedBy(0.7);
    }];
    
}

@end
