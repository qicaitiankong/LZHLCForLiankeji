//
//  firstPageButtonGroup.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/15.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageButtonGroup.h"
#import "appCommonAttributes.h"
@implementation firstPageButtonGroup
NSMutableArray *buttonArr1;
NSMutableArray *buttonArr2;

-(UIView*)initWithFrame:(CGRect)frame titleArray:(NSMutableArray*)_titleArray imageArr:(NSMutableArray*)_imageArr groupDelegate:(id<groupButtonDelegate>)_groupDelegate{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    if(self){
        buttonArr1 = [[NSMutableArray alloc]init];
        buttonArr2 = [[NSMutableArray alloc]init];
        for(NSInteger i = 0; i < _titleArray.count; i ++){
            CenterSmallView *smallView = [[CenterSmallView alloc]initWithFrame:CGRectZero image:_imageArr[i] lableTitle:_titleArray[i] lableTextCenter:YES delegate:_groupDelegate buttonTag:i + 1];
            if(i < 3){
                [buttonArr1 addObject:smallView];
            }else{
                [buttonArr2 addObject:smallView];
            }
            [self addSubview:smallView];
        }
    }
        [self addAdaptation];
       return self;
}

- (void)addAdaptation{
    //NSLog(@"中间按钮组高度=%lf",self.frame.size.height);
    [buttonArr1 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:self.frame.size.width * 0.08 leadSpacing:self.frame.size.width * 0.041 tailSpacing:self.frame.size.width * 0.041];
    [buttonArr1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.height.mas_equalTo((self.frame.size.height - 15) * 0.5);
    }];
    UIButton *button1 = buttonArr1[0];
    //第二行按钮
    [buttonArr2 mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:self.frame.size.width * 0.08 leadSpacing:self.frame.size.width * 0.041 tailSpacing:self.frame.size.width * 0.041];
    [buttonArr2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_bottom).offset(5);
        make.height.mas_equalTo((self.frame.size.height - 15) * 0.5);
    }];

    
}

//设置view样式
- (void)setStyleOfView :(UIView*)_view{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
