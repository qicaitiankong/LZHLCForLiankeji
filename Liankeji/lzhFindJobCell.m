//
//  lzhFindJobCell.m
//  suipianTest
//
//  Created by mac on 2017/2/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "lzhFindJobCell.h"
#import "lzhFindJobCellGroupView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>
#define CELL_HEIGHT 100


@implementation lzhFindJobCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetTableView:(UITableView*)tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //设置cell自带属性
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //添加子视图
        self.personImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, self.contentView.frame.size.height * 0.8, self.contentView.frame.size.height * 0.8)];
        self.personImageView.backgroundColor = [UIColor grayColor];
        self.personImageView.clipsToBounds = YES;// 超出主层边框就要裁剪掉
        self.personImageView.layer.cornerRadius = CELL_HEIGHT * 0.8 * 0.5;
        self.personImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
        [self.contentView addSubview:self.personImageView];
        //
        self.personNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.personImageView.frame.origin.x + self.personImageView.frame.size.width + 5, self.personImageView.frame.origin.y, 120, self.contentView.frame.size.height * 0.25)];
        self.personNameLabel.text = @"罗海云";
        self.personNameLabel.font = [UIFont systemFontOfSize:15];
        //self.personNameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.personNameLabel];
        //
        self.personJobLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.personNameLabel.frame.origin.x, self.personNameLabel.frame.origin.y + self.personNameLabel.frame.size.height, self.personNameLabel.frame.size.width, self.contentView.frame.size.height * 0.25)];
        self.personJobLabel.text = @"JAVA开发工程师";
        self.personJobLabel.font = [UIFont systemFontOfSize:13];
        self.personJobLabel.textColor = RGBA(35, 35, 35, 0.9);
        [self.contentView addSubview:self.personJobLabel];
        //
        self.personSalaryLabel = [[UILabel alloc]initWithFrame:CGRectMake(tableView.frame.size.width - 100, self.personNameLabel.frame.origin.y, 80, self.personNameLabel.frame.size.height)];
        self.personSalaryLabel.font = [UIFont systemFontOfSize:15];
        self.personSalaryLabel.text = @"6K-7K";
        self.personSalaryLabel.textColor = RGBA(0, 156, 207, 1);
        //self.personSalaryLabel.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.personSalaryLabel];
        //
        lzhFindJobCellGroupView *groupView = [[lzhFindJobCellGroupView alloc]initWithFrame:CGRectMake(self.personJobLabel.frame.origin.x, self.personJobLabel.frame.origin.y + self.personJobLabel.frame.size.height, 300, self.contentView.frame.size.height * 0.2)];
        groupView.firstLabel.text = @"山东-青岛";
        groupView.secondLabel.text = @"大专";
        groupView.thirdLabel.text = @"5年";
        self.locationLabel = groupView.firstLabel;
        self.academicLabel = groupView.secondLabel;
        self.experienceLabel = groupView.thirdLabel;
        [self.contentView addSubview:groupView];
        //适配
        NSMutableArray *viewArr = [[NSMutableArray alloc]init];
        [viewArr addObject:self.personNameLabel];
        [viewArr addObject:self.personJobLabel];
        [viewArr addObject:groupView];
        //
        [self.personImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.top.mas_equalTo(self.contentView).offset(CELL_HEIGHT * 0.1);
            make.height.mas_equalTo(self.contentView).multipliedBy(0.8);
            make.width.mas_equalTo(self.personImageView.mas_height);

            
        }];
        //
        [self.personSalaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.contentView).multipliedBy(0.2);
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.personImageView.mas_top).offset(0);
            make.height.mas_equalTo(self.personImageView).multipliedBy(0.25);
        }];
        //
        [viewArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:0 leadSpacing:CELL_HEIGHT * 0.1 tailSpacing:CELL_HEIGHT * 0.1];
        [viewArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.personImageView.mas_right).offset(5);
            make.right.mas_equalTo(self.personSalaryLabel.mas_left).offset(-5);
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
