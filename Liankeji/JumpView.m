//
//  JumpView.m
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "JumpView.h"
#import "JumpButton.h"
#import "appCommonAttributes.h"

@implementation JumpView

- (instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray andImageArray:(NSArray *)imageArray{

    self = [super initWithFrame:frame];
    if (self) {
        //添加样式
        self.backgroundColor = RGBA(35, 35, 35, 0.5);
        self.userInteractionEnabled = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        //添加点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOn)];
        [self addGestureRecognizer:tap];
        
        for (int i=1; i<=4; i++) {
            JumpButton *jumpbutton = [[JumpButton alloc]initWithFrame:CGRectMake(0, self.frame.size.height*(1-0.1*i)-(i-1)*0.5, self.frame.size.width, self.frame.size.height*0.1) andText:titleArray[i-1] andImageName:imageArray[i-1]];
            [jumpbutton addTarget:self action:@selector(buttonOn:) forControlEvents:UIControlEventTouchUpInside];
            jumpbutton.tag = 100000+i;
            [self addSubview:jumpbutton];
        }
    }
    return self;
}

#pragma mark - 点击删除当前视图
- (void)tapOn{

    [self.jumpDelegate remove];
}


#pragma mark - 点击执行操作
- (void)buttonOn:(UIButton *)button{

    [self.jumpDelegate acitonOpen:button];
}

@end
