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
            smallView.leftButt.tag = i;//0,1,2
            smallView.rightTitleLabel.tag = i + 3;//3,4,5
            smallView.rightTitleLabel.text = titleArr[i];
            [smallView.leftButt addTarget:self action:@selector(clickPrais:) forControlEvents:UIControlEventTouchUpInside];
            [groupArr addObject:smallView];
            self.leftButt = smallView.leftButt;
            self.rightLabel = smallView.rightTitleLabel;
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
//点赞评论举报
- (void)clickPrais:(UIButton*)_b{
    if(self.targetDelegate == nil){
        return;
    }
        switch (_b.tag) {
            case 0://点赞
                [self.targetDelegate clickPraiseButton:[[_b superview] viewWithTag:_b.tag + 3]];
                break;
            case 1://评论
                  [self.targetDelegate clickCommentButton:[[_b superview] viewWithTag:_b.tag + 3]];
                break;
    
            case 2://举报
                  [self.targetDelegate clickJuBaoButton:[[_b superview] viewWithTag:_b.tag + 3]];
                break;
            default:
                break;
        }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
