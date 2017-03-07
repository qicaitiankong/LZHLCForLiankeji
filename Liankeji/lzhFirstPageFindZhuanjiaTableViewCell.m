//
//  lzhFirstPageFindZhuanjiaTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhFirstPageFindZhuanjiaTableViewCell.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

@implementation lzhFirstPageFindZhuanjiaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentLabelHeight:(CGFloat)height{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //
        self.userButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.userButt.frame = CGRectMake(0, 5, 50, 50);
        self.userButt.layer.cornerRadius = SCREEN_HEIGHT * 0.052 * 0.5;
        self.userButt.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userButt];
        //
        self.userNameLabel = [[UILabel alloc]init];
        self.userNameLabel.font = [UIFont systemFontOfSize:16];
        //self.userNameLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.userNameLabel];
        //
        self.jobLabel = [[UILabel alloc]init];
        //self.jobLabel.backgroundColor = [UIColor grayColor];
        self.jobLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.jobLabel];
        //
        self.homePlace = [[UILabel alloc]init];
        //self.homePlace.backgroundColor = [UIColor grayColor];
        self.homePlace.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.homePlace];
        //
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.homePlace.frame.origin.y + self.homePlace.frame.size.height + 5, SCREEN_WIDTH * 0.75, height)];
        //self.contentLabel.backgroundColor = [UIColor grayColor];
        self.contentLabel.font = [UIFont systemFontOfSize:13];
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
        //
        self.beginMoneyLabel = [[UILabel alloc]init];
        //self.beginMoneyLabel.backgroundColor = [UIColor grayColor];
        self.beginMoneyLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.beginMoneyLabel];
        //
        self.purchasePersonNumberLabel = [[UILabel alloc]init];
        //self.purchasePersonNumberLabel.backgroundColor = [UIColor grayColor];
        self.purchasePersonNumberLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.purchasePersonNumberLabel];
        //
        [self.userButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.top.mas_equalTo(self.contentView).offset(5);
            make.height.mas_equalTo(SCREEN_HEIGHT * 0.052);
            make.width.mas_equalTo(self.userButt.mas_height);
        }];
        //
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userButt.mas_right).offset(5);
            make.top.mas_equalTo(self.userButt.mas_top).offset(2);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(self.userButt).multipliedBy(0.35);
        }];
        //
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userNameLabel.mas_right).offset(5);
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.userNameLabel);
            make.height.mas_equalTo(self.userNameLabel);
        }];
        //
        [self.homePlace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userNameLabel);
            make.top.mas_equalTo(self.userNameLabel.mas_bottom).offset(5);
            make.height.mas_equalTo(self.userButt).multipliedBy(0.35);
            make.right.mas_equalTo(self.contentView);
        }];
        //
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.homePlace);
            make.top.mas_equalTo(self.homePlace.mas_bottom).offset(5);
            make.height.mas_equalTo(height);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.75);
        }];
        //
        [self.beginMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentLabel);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(5);
            make.height.mas_equalTo(20);
        }];
        //
        [self.purchasePersonNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentLabel);
            make.width.mas_equalTo(80);
            make.top.mas_equalTo(self.beginMoneyLabel);
            make.height.mas_equalTo(self.beginMoneyLabel);
        }];
        
        
        
        //
    }
    return self;
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
