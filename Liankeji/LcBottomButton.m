//
//  LcBottomButton.m
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcBottomButton.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation LcBottomButton

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createBottomView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createBottomView{

    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    [self addSubview:self.picImageView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.nameLabel];
    
    //添加布局
    WS(ws);
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.bottom.mas_equalTo(ws.mas_bottom).with.offset(-SCREEN_HEIGHT*0.05);
        make.width.height.mas_equalTo(SCREEN_HEIGHT*0.025);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws);
        make.top.mas_equalTo(ws.mas_top).with.offset(SCREEN_HEIGHT*0.05);
        make.width.mas_equalTo(ws);
        make.height.mas_equalTo(SCREEN_HEIGHT*0.05);
    }];
}







@end
