//
//  lzhFirstPageScienceDetaileCellHeader.m
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhFirstPageScienceDetaileCellHeader.h"
#import "lzhFirstpageSecondCellView1.h"
#import "appCommonAttributes.h"
#import "lzhDetaileScienCellHeaderSmallView.h"
#import <Masonry.h>

@implementation lzhFirstPageScienceDetaileCellHeader
@synthesize contentLabel;

- (instancetype)initWithFrame:(CGRect)frame delegate:(id)targetDelegate contentHeight:(CGFloat)labelContentHeight
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        lzhFirstpageSecondCellView1 *viewModel1 = [[lzhFirstpageSecondCellView1 alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,60)];
        [self addSubview:viewModel1];
        //
        UIView *spaceView1 = [[UIView alloc]init];
        spaceView1.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceView1];
        
        
        //
        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, viewModel1.frame.origin.y + viewModel1.frame.size.height, self.frame.size.width - 2 * 5, labelContentHeight)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.backgroundColor = [UIColor whiteColor];
        contentLabel.textColor = [UIColor colorWithRed:161 / 255 green:161 / 255 blue:161 / 255 alpha:1];
        [self addSubview:contentLabel];
        //
        UIView *spaceView2 = [[UIView alloc]init];
        spaceView2.backgroundColor = RGBA(246, 246, 246, 1);
        [self addSubview:spaceView2];
        
        //
        lzhDetaileScienCellHeaderSmallView *ViewModel3 = [[lzhDetaileScienCellHeaderSmallView alloc]initWithFrame:CGRectMake(5, 0, 10, 10)];
        self.commentNumberLabel = ViewModel3.commentNumberLabel;
        self.praiseNumberLabel = ViewModel3.praiseNumberLabel;
        [self addSubview:ViewModel3];
        //
        [viewModel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(0);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(SCREEN_HEIGHT * 0.067);
        }];
        //
        [spaceView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(viewModel1.mas_bottom);
            make.height.mas_equalTo(5);
        }];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(viewModel1.mas_bottom).offset(5);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(labelContentHeight);
        }];
        //
        [spaceView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(contentLabel.mas_bottom);
            make.height.mas_equalTo(10);
        }];
        //
        [ViewModel3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(spaceView2.mas_bottom);
            make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(SCREEN_HEIGHT * 0.067);
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
