//
//  PersonMessageCell.m
//  Liankeji
//
//  Created by liuchen on 2017/2/28.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonMessageCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation PersonMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建视图
        [self createPesonView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createPesonView{

    //添加子视图
    self.tLabel = [[UILabel alloc]init];
    [self addSubview:self.tLabel];
    
    self.picImageView = [[UIImageView alloc]init];
    self.picImageView.layer.masksToBounds = YES;
    self.picImageView.layer.cornerRadius =10;
    [self addSubview:self.picImageView];
    
    //开始布局
    WS(ws);
    [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ws);
        make.height.width.mas_equalTo(ws.mas_width).multipliedBy(0.2);
        make.left.mas_equalTo(ws).with.offset(5);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws).with.offset(-10);
        make.centerY.mas_equalTo(ws);
        make.width.height.mas_equalTo(ws.mas_height).multipliedBy(0.7);
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
