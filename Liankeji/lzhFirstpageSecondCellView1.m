//
//  lzhFirstpageSecondCellView1.m
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhFirstpageSecondCellView1.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

@implementation lzhFirstpageSecondCellView1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.imageButt = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imageButt.frame = CGRectMake(0, 0, self.bounds.size.height * 0.8, self.bounds.size.height * 0.8);
        self.imageButt.layer.cornerRadius = self.imageButt.frame.size.width / 2;
        self.imageButt.backgroundColor = [UIColor grayColor];
        
        [self addSubview:self.imageButt];
        //
        [self.imageButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(10);
            make.height.mas_equalTo(self).multipliedBy(0.8);
            make.width.mas_equalTo(self.imageButt.mas_height);
            make.centerY.mas_equalTo(self.mas_centerY);
            
        }];
        //
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textColor = RGBA(72, 72, 72, 1);
        self.nameLabel.text = @"李自豪";
        //self.nameLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageButt.mas_right).offset(5);
            make.right.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(self.imageButt.mas_height).multipliedBy(0.5);
            make.centerY.mas_equalTo(self);
            
        }];
        //
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:15];
        self.timeLabel.textColor = RGBA(72, 72, 72, 1);
        self.timeLabel.text = @"2017-12-25";
        //self.timeLabel .backgroundColor = [UIColor grayColor];
        [self addSubview:self.timeLabel];
        [self.timeLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_centerX).offset(30);
            make.right.mas_equalTo(self).offset(-5);
            make.height.mas_equalTo(self.nameLabel);
            make.centerY.mas_equalTo(self);
        }];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
