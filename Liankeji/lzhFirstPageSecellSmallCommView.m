//
//  lzhFirstPageSecellSmallCommView.m
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhFirstPageSecellSmallCommView.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

@implementation lzhFirstPageSecellSmallCommView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,50, 30)];
        self.userNameLabel.font = [UIFont systemFontOfSize:12];
        self.userNameLabel.textColor = RGBA(89, 185, 226, 1);
        self.userNameLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:self.userNameLabel];
        
        self.commentLabel = [[UILabel alloc]init];
        //self.commentLabel.backgroundColor = [UIColor grayColor];
        self.commentLabel.textColor = RGBA(106, 106, 106, 1);
        self.commentLabel.numberOfLines = 0;
        self.commentLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.commentLabel];
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.top.mas_equalTo(self);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.15);
            make.height.mas_equalTo(10);
        }];
        
        [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userNameLabel.mas_right).offset(5);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.7);
            make.top.mas_equalTo(self.userNameLabel);
            make.bottom.mas_equalTo(self);
            NSLog(@"子LABELE布局");
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
