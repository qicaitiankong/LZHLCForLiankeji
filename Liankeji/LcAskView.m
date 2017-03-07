//
//  LcAskView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcAskView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LcAskView

- (instancetype)initWithFrame:(CGRect)frame andDic:(NSDictionary *)dic{

    self = [super initWithFrame:frame];
    if (self) {
        if (dic == nil) {
            //创建视图
            [self createAskView];
        }
    }
    return self;
}


#pragma mark  -添加视图
- (void)createAskView{

    //添加底层视图颜色布局
    self.backgroundColor = RGBA(0, 177, 251, 1);
    self.userInteractionEnabled = YES;
    //添加子视图
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"WechatIMG.png"] forState:UIControlStateNormal];
    [self.backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self.backButton.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.backButton];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.textColor = [UIColor whiteColor];
    self.tLabel.font = [UIFont systemFontOfSize:18];
    self.tLabel.textAlignment = NSTextAlignmentCenter;
    self.tLabel.text = @"专家问答";
    [self addSubview:self.tLabel];
    
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
    self.picImageView.layer.masksToBounds = YES;
    self.picImageView.layer.cornerRadius = self.frame.size.height*0.3/2.0;
    [self addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.tLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.text = @"大咖";
    [self addSubview:self.nameLabel];
    
    self.fieldLabel = [[UILabel alloc]init];
    self.fieldLabel.textColor = [UIColor whiteColor];
    self.fieldLabel.font = [UIFont systemFontOfSize:15];
    self.fieldLabel.text = @"擅长领域";
    [self addSubview:self.fieldLabel];
    
    self.numOfLabel = [[UILabel alloc]init];
    self.numOfLabel.numberOfLines = 0;
    self.numOfLabel.textColor = [UIColor whiteColor];
    self.numOfLabel.font = [UIFont systemFontOfSize:13];
    self.numOfLabel.text = [NSString stringWithFormat:@"%@人\n\n咨询人数",@"3606"];
    self.numOfLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.numOfLabel];
    //
    self.praiseOfLabel = [[UILabel alloc]init];
    self.praiseOfLabel.numberOfLines = 0;
    self.praiseOfLabel.textColor = [UIColor whiteColor];
    self.praiseOfLabel.font = [UIFont systemFontOfSize:13];
    self.praiseOfLabel.text = [NSString stringWithFormat:@"%@人\n\n好评率",@"100%"];
    self.praiseOfLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.praiseOfLabel];
    //
    self.approvalOfLabel = [[UILabel alloc]init];
    self.approvalOfLabel.numberOfLines = 0;
    self.approvalOfLabel.textColor = [UIColor whiteColor];
    self.approvalOfLabel.font = [UIFont systemFontOfSize:13];
    self.approvalOfLabel.text = [NSString stringWithFormat:@"%@人\n\n同行认可",@"100%"];
    self.approvalOfLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.approvalOfLabel];
    
    //视图布局
    WS(ws);
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).with.offset(15);
        make.top.mas_equalTo(ws.mas_top).with.offset(15);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.06);
        make.height.mas_equalTo(ws.mas_width).multipliedBy(0.06);
    }];
    
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws.backButton.mas_top);
        make.height.mas_equalTo(ws.backButton);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.5);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).with.offset(10);
        make.centerY.mas_equalTo(ws.mas_centerY).with.offset(-10);
        make.width.height.mas_equalTo(ws.mas_height).multipliedBy(0.30);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.picImageView.mas_right).with.offset(10);
        make.top.mas_equalTo(ws.picImageView.mas_top);
        make.height.mas_equalTo(ws.mas_height).multipliedBy(0.1);
        make.width.mas_equalTo(ws).multipliedBy(0.5);
    }];
    
    [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.picImageView.mas_bottom);
        make.left.mas_equalTo(ws.nameLabel.mas_left);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(ws).multipliedBy(0.1);
    }];
    
    [self.numOfLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.35);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.33333);
    }];
    
    [self.praiseOfLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.numOfLabel.mas_right);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.35);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.33333);
    }];
    
    [self.approvalOfLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.praiseOfLabel.mas_right);
        make.bottom.mas_equalTo(ws);
        make.height.mas_equalTo(ws).multipliedBy(0.35);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.33333);
    }];
}





@end
