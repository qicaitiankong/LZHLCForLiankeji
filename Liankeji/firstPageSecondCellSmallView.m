//
//  firstPageSecondCellSmallView.m
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageSecondCellSmallView.h"
#import <Masonry.h>

@implementation firstPageSecondCellSmallView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftButt = [UIButton buttonWithType:UIButtonTypeCustom];
        //self.leftButt.backgroundColor = [UIColor grayColor];
        [self addSubview:self.leftButt];
        [self.leftButt mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.bottom.mas_equalTo(self);
            make.width.mas_equalTo(self.mas_height);
        }];
        //
        self.rightTitleLabel = [[UILabel alloc]init];
        self.rightTitleLabel.font = [UIFont systemFontOfSize:14];
        //self.rightTitleLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.rightTitleLabel];
        [self.rightTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftButt.mas_right).offset(5);
            make.right.mas_equalTo(self);
            make.height.mas_equalTo(self).multipliedBy(0.8);
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
