//
//  ResumeCell.m
//  Liankeji
//
//  Created by liuchen on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ResumeCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation ResumeCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDic:(NSDictionary *)dic{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建视图
        [self createResumeView];
    }
    return self;
}


#pragma mark - 创建视图
- (void)createResumeView{

    //添加子视图
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.textColor = RGBA(56, 56, 56, 0.4);
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.timeLabel];
    
    self.companyLabel = [[UILabel alloc]init];
    self.companyLabel.textAlignment = NSTextAlignmentCenter;
    self.companyLabel.textColor = [UIColor blackColor];
    self.companyLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.companyLabel];
    
    self.positionLabel = [[UILabel alloc]init];
    self.positionLabel.textAlignment = NSTextAlignmentCenter;
    self.positionLabel.textColor = [UIColor blackColor];
    self.positionLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.positionLabel];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addButton setImage:[UIImage imageNamed:@"添加照片.pn"] forState:UIControlStateNormal];
    [self addSubview:self.addButton];
    
    //开始布局
    WS(ws);
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).with.offset(20);
        make.top.mas_equalTo(ws);
        make.height.mas_equalTo(ws.mas_height).multipliedBy(0.5);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.5);
    }];
    [self.positionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.timeLabel.mas_left);
        make.top.mas_equalTo(ws.timeLabel.mas_bottom);
        make.bottom.mas_equalTo(ws.mas_bottom);
        make.width.mas_equalTo(ws.mas_width).multipliedBy(0.3);
    }];
    [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.positionLabel.mas_right);
        make.top.bottom.height.mas_equalTo(ws.positionLabel);
    }];
    [self.addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.width.height.mas_equalTo(ws.mas_height).multipliedBy(0.3);
    }];
    
}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
