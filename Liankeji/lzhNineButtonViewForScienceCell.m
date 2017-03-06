//
//  lzhNineButtonViewForScienceCell.m
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhNineButtonViewForScienceCell.h"

@implementation lzhNineButtonViewForScienceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
                CGFloat buttonWidth = (self.frame.size.width- 5 * 4) / 3;
                CGFloat j =  0;
                CGFloat buttonY = 5;
                for(NSInteger i = 0 ; i < 9; i ++){
                    UIButton *butt = [UIButton buttonWithType:UIButtonTypeCustom];
                    butt.layer.cornerRadius = 10;
                    [butt setImage:[UIImage imageNamed:@"a1"] forState:UIControlStateNormal];
                    if(i % 3 == 0){
                        buttonY = i / 3 * (buttonWidth + 5) + 5;
                        j = 0;
                    }
                    //butt.backgroundColor = [UIColor grayColor];
                    butt.frame = CGRectMake(j *(buttonWidth +5) , buttonY, buttonWidth, buttonWidth);
                    [self addSubview:butt];
                    j ++;
                }

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
