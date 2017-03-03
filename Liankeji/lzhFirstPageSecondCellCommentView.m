//
//  lzhFirstPageSecondCellCommentView.m
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhFirstPageSecondCellCommentView.h"
#import "lzhFirstPageSecellSmallCommView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>


@implementation lzhFirstPageSecondCellCommentView
lzhFirstPageSecellSmallCommView *smalCommeView;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(244, 248, 251, 1);
        //
        smalCommeView = [[lzhFirstPageSecellSmallCommView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        self.userNameLabel = smalCommeView.userNameLabel;
        self.commentLabel = smalCommeView.commentLabel;
        [self addSubview:smalCommeView];
        [smalCommeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.mas_equalTo(self);
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
