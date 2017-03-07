//
//  lzhDetaileScienCellHeaderSmallView.m
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhDetaileScienCellHeaderSmallView.h"
#import <Masonry.h>

@implementation lzhDetaileScienCellHeaderSmallView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.commentNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, self.frame.size.height)];
        self.commentNumberLabel.text = @"评论";
        self.commentNumberLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.commentNumberLabel];
        //
        self.praiseNumberLabel = [[UILabel alloc]init];
        self.praiseNumberLabel.font = [UIFont systemFontOfSize:15];
        self.praiseNumberLabel.text = @"赞";
        [self addSubview:self.praiseNumberLabel];
        //
        [self.commentNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(self).multipliedBy(0.8);
            make.centerY.mas_equalTo(self);
        }];
        //
        [self.praiseNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentNumberLabel.mas_right);
            make.width.mas_equalTo(100);
            make.top.bottom.mas_equalTo(self.commentNumberLabel);
        }];
        //
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
