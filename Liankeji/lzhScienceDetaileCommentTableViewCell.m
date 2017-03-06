//
//  lzhScienceDetaileCommentTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhScienceDetaileCommentTableViewCell.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

@implementation lzhScienceDetaileCommentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentLabelHeight:(CGFloat)contentHeight{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        self.commentUserbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.commentUserbutton.frame = CGRectMake(0, 0, 10, 10);
        self.commentUserbutton.backgroundColor = [UIColor grayColor];
        self.commentUserbutton.layer.cornerRadius = SCREEN_HEIGHT * 0.082 * 0.5;
        [self.contentView addSubview:self.commentUserbutton];
        //
        [self.commentUserbutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.height.width.mas_equalTo(SCREEN_HEIGHT * 0.082);
            make.top.mas_equalTo(self.contentView).offset(5);
            
        }];
        //
        self.commentNameLab = [[UILabel alloc]init];
        self.commentNameLab.frame = CGRectMake(0, 0, 10, 10);
        //self.commentNameLab.backgroundColor = [UIColor grayColor];
        self.commentNameLab.font = [UIFont systemFontOfSize:15];

        [self.contentView addSubview:self.commentNameLab];
        [self.commentNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentUserbutton.mas_right).offset(5);
            make.right.mas_equalTo(self.contentView.mas_centerX);
            make.top.mas_equalTo(self.commentUserbutton).offset(5);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.35);
        }];
        
        
        //
        self.commentJobLab = [[UILabel alloc]init];
         self.commentJobLab.frame = CGRectMake(0, 0, 10, 10);
        //self.commentJobLab.backgroundColor = [UIColor grayColor];
        self.commentJobLab.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.commentJobLab];
        //
        [self.commentJobLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentNameLab);
            make.right.mas_equalTo(self.contentView.mas_centerX);
            make.top.mas_equalTo(self.commentNameLab.mas_bottom).offset(5);
            make.height.mas_equalTo(self.commentUserbutton).multipliedBy(0.35);
        }];
        //
        self.commentTimeLab = [[UILabel alloc]init];
        //self.commentTimeLab.backgroundColor = [UIColor grayColor];
        self.commentTimeLab.font = [UIFont systemFontOfSize:15];

        [self.contentView addSubview:self.commentTimeLab];
        [self.commentTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.commentNameLab);
            make.height.mas_equalTo(self.commentNameLab);
            make.width.mas_equalTo(self.contentView).multipliedBy(0.25);
            make.right.mas_equalTo(self.contentView).offset(-10);
        }];
        //
        self.commentContentLabel = [[UILabel alloc]init];
        //self.commentContentLabel.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.commentContentLabel];
        self.commentContentLabel.numberOfLines = 0;
        self.commentContentLabel.font = [UIFont systemFontOfSize:15];
        [self.commentContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.commentUserbutton.mas_bottom).offset(5);
            make.height.mas_equalTo(contentHeight);
        }];
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
