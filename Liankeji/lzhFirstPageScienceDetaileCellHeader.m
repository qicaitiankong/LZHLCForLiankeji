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
        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, viewModel1.frame.origin.y + viewModel1.frame.size.height, self.frame.size.width - 2 * 5, labelContentHeight)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.backgroundColor = [UIColor whiteColor];
        contentLabel.textColor = [UIColor colorWithRed:161 / 255 green:161 / 255 blue:161 / 255 alpha:1];
        [self addSubview:contentLabel];
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
