//
//  JumpButton.m
//  Liankeji
//
//  Created by liuchen on 2017/2/24.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "JumpButton.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation JumpButton

-(instancetype)initWithFrame:(CGRect)frame andText:(NSString *)text andImageName:(NSString *)imageName{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        WS(ws);
        self.backgroundColor = [UIColor whiteColor];
        //添加子视图
        self.picImageView = [[UIImageView alloc]init];
        self.picImageView.image = [UIImage imageNamed:imageName];
        [self addSubview:self.picImageView];
        
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.text = text;
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.nameLabel];
        
        //视图布局
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(ws.mas_right).multipliedBy(0.5).with.offset(-2);
            make.height.mas_equalTo(ws.mas_height).multipliedBy(0.4);
            make.width.mas_equalTo(ws.mas_height).multipliedBy(0.4);
            make.centerY.mas_equalTo(ws.mas_centerY);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.picImageView.mas_right).with.offset(4);
            make.height.mas_equalTo(ws.picImageView);
            make.right.mas_equalTo(ws.mas_right).with.offset(-10);
            make.centerY.mas_equalTo(ws.picImageView);
        }];
        
//        //添加样式
//        self.layer.masksToBounds = YES;
//        self.layer.borderWidth = 1;
//        self.layer.borderColor = [UIColor grayColor].CGColor;
    }
    return self;
}


@end
