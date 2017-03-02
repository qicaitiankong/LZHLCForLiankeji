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

@implementation lzhFirstPageSecondCellCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = RGBA(<#r#>, <#g#>, <#b#>, <#a#>);
        //
        lzhFirstPageSecellSmallCommView *smalCommeView = [[lzhFirstPageSecellSmallCommView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.4)];
        [self addSubview:smalCommeView];
        
        
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
