//
//  firstPageSecondCellGroupview.m
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageSecondCellGroupview.h"
#import "firstPageSecondCellSmallView.h"
#import <Masonry.h>

@implementation firstPageSecondCellGroupview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSMutableArray *imageArr = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"lzhfirstPageSecondCellPraise.png"],[UIImage imageNamed:@"lzhfirstPageSecondCellComment.png"],[UIImage imageNamed:@"lzhfirstPageSecondCellJuBao.png"], nil];
        NSMutableArray *groupArr = [NSMutableArray arrayWithCapacity:3];
        NSArray *titleArr = @[@"点赞",@"评论",@"举报"];
        for(int i = 0 ; i < 3; i ++){
            firstPageSecondCellSmallView *smallView = [[firstPageSecondCellSmallView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
            [smallView.leftButt setImage:imageArr[i] forState:UIControlStateNormal];
            smallView.rightTitleLabel.text = titleArr[i];
            [groupArr addObject:smallView];
            [self addSubview:smallView];
        }
        //
        [groupArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:10 tailSpacing:-5];
        [groupArr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
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
