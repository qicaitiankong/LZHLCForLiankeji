//
//  lzhZhuanjiawendaTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhZhuanjiawendaTableViewCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation lzhZhuanjiawendaTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentHeight:(CGFloat)contentHeight{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //
        self.backgroundColor = [UIColor whiteColor];
        self.commentUserbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.commentUserbutton.frame = CGRectMake(0, 0, 10, 10);
        self.commentUserbutton.backgroundColor = [UIColor grayColor];
        self.commentUserbutton.layer.cornerRadius = SCREEN_HEIGHT * 0.082 * 0.5;
        [self.contentView addSubview:self.commentUserbutton];
        //
        self.commentNameLab = [[UILabel alloc]init];
        //self.commentNameLab.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.commentNameLab];
        //
        self.commentJobLab = [[UILabel alloc]init];
        //self.commentJobLab.backgroundColor = [UIColor grayColor];
        self.commentJobLab.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.commentJobLab];
        //
        self.questionButt = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.questionButt.backgroundColor = [UIColor grayColor];
        [self.questionButt setTitle:@"提问" forState:UIControlStateNormal];
        [self.questionButt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.questionButt.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.questionButt];
        //
        self.commentTimeLab = [[UILabel alloc]init];
        //self.commentTimeLab.backgroundColor = [UIColor grayColor];
        self.commentTimeLab.font = [UIFont systemFontOfSize:15];

        [self.contentView addSubview:self.commentTimeLab];
        //
        self.questionContentLabel = [[UILabel alloc]init];
        //self.questionContentLabel.backgroundColor = [UIColor grayColor];
        self.questionContentLabel.numberOfLines = 0;
        self.questionContentLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.questionContentLabel];
        //
        self.lookButt = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.lookButt.backgroundColor = [UIColor grayColor];
        [self.lookButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         self.lookButt.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.lookButt];
        //
        [self.commentUserbutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.height.width.mas_equalTo(SCREEN_HEIGHT * 0.082);
            make.top.mas_equalTo(self.contentView).offset(5);
            
        }];
        //
        //
        [self.commentNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentUserbutton.mas_right).offset(5);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.commentUserbutton);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.35);
        }];
        //
        [self.commentJobLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentNameLab);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.commentNameLab.mas_bottom).offset(5);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.35);
        }];
        //
        [self.questionButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentNameLab.mas_right).offset(5);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.45);
            make.centerY.mas_equalTo(self.commentUserbutton);
        }];
        //
        [self.commentTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(100);
            make.centerY.mas_equalTo(self.commentUserbutton);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.35);
            make.right.mas_equalTo(self.contentView).offset(-5);
        }];
        //
        [self.questionContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(SCREEN_WIDTH* 0.95);
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.commentUserbutton.mas_bottom).offset(5);
            make.height.mas_equalTo(contentHeight);
        }];
        //
      [self.lookButt mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(self.questionContentLabel.mas_bottom).offset(5);
          make.height.mas_equalTo(20);
          make.width.mas_equalTo(100);
          make.right.mas_equalTo(self.questionContentLabel);
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
