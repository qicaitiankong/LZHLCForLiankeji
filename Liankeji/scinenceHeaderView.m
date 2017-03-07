//
//  scinenceHeaderView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "scinenceHeaderView.h"
#import "appCommonAttributes.h"

@implementation scinenceHeaderView
NSInteger currentIndex;

-(instancetype)initWithFrame:(CGRect)frame{
    currentIndex = 0;
    self = [super initWithFrame:frame];
    self.backgroundColor = RGBA(244, 244, 244, 1);
    if(self){
        //
        UISegmentedControl *segumentControl = [[UISegmentedControl alloc]initWithItems:@[@"科技圈",@"专家问答"]];
        segumentControl.frame = CGRectMake(0, 0,self.frame.size.width, self.frame.size.height);
        //UIColor *tintColor = RGBA(52, 124, 205, 1);
        //[segumentControl setTintColor:tintColor];
        [segumentControl addTarget:self action:@selector(actionHandler:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:segumentControl];
        [segumentControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.top.equalTo(self).offset(SCREEN_HEIGHT * 0.018);
            make.bottom.equalTo(self).offset(-SCREEN_HEIGHT * 0.018);
        }];
        //
    }
    return  self;
}

- (void)actionHandler:(UISegmentedControl*)_u{
    if(currentIndex == _u.selectedSegmentIndex){
        return;
    }
    if(self.targetDelegate){
        NSLog(@"有效点击状态分隔符");
        UIColor *tintColor = RGBA(52, 124, 205, 1);
        [_u setTintColor:tintColor];
        [self.targetDelegate clickSegumentIndex:_u.selectedSegmentIndex];
    }
    currentIndex = _u.selectedSegmentIndex;
    //NSLog(@"在点击分栏控制器：%li",_u.selectedSegmentIndex);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
