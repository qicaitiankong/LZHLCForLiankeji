//
//  ResumeButton.m
//  Liankeji
//
//  Created by liuchen on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ResumeButton.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation ResumeButton

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createResumeView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createResumeView{

    //添加子视图
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.image = [UIImage imageNamed:@"添加照片.png"];
    [self addSubview:self.picImageView];
    
    self.tLabel = [[UILabel alloc]init];
    self.tLabel.textColor = [UIColor blackColor];
    self.tLabel.textAlignment = NSTextAlignmentCenter;
    self.tLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.tLabel];
    
    //开始布局
    WS(ws);
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws).with.offset(10);
        make.top.mas_equalTo(ws).with.offset(10);
        make.bottom.mas_equalTo(ws).with.offset(-10);
        make.width.mas_equalTo(ws.picImageView.mas_height);
    }];
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.left.mas_equalTo(ws.picImageView.mas_right);
        make.top.bottom.right.mas_equalTo(ws);
    }];
}









@end
