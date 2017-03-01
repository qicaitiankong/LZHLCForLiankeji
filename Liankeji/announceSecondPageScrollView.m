//
//  announceSecondPageScrollView.m
//  Liankeji
//
//  Created by mac on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "announceSecondPageScrollView.h"
#import "announSecondPageNextStepView.h"

@implementation announceSecondPageScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height + 50);
        [self addSubview:scrollView];
        //
        announSecondPageNextStepView *secondWriteView = [[announSecondPageNextStepView alloc]initWithFrame:CGRectMake(0, 0, scrollView.bounds.size.width, scrollView.bounds.size.height + 50)];
        self.previousButt = secondWriteView.commitButt.previousButt;
        self.commitButt = secondWriteView.commitButt.nextButt;
        [scrollView addSubview:secondWriteView];
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
