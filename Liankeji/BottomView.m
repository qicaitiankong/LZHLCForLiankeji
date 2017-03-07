//
//  BottomView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BottomView.h"
#import "appCommonAttributes.h"


@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(224, 224, 224, 1);
        //创建视图
        [self createBottomView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createBottomView{
    
    //添加子视图
    self.followButton = [[LcBottomButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
    self.followButton.picImageView.image = [UIImage imageNamed:@"关注.png"];
    self.followButton.nameLabel.text = @"关注";
    [self.followButton setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.followButton];
    
    self.rewardButton = [[LcBottomButton alloc] initWithFrame:CGRectMake(self.followButton.frame.size.width+1, 0, self.frame.size.height, self.frame.size.height)];
    self.rewardButton.picImageView.image = [UIImage imageNamed:@"打赏.png"];
    self.rewardButton.nameLabel.text = @"打赏";
    [self.rewardButton setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.rewardButton];
    
    self.askButton = [[UIButton alloc] initWithFrame:CGRectMake(self.rewardButton.frame.origin.x+self.rewardButton.frame.size.width, 0, self.frame.size.width-self.rewardButton.frame.size.width-self.rewardButton.frame.origin.x+1, self.frame.size.height)];
    self.askButton.backgroundColor = RGBA(0, 177, 251, 1);
    [self.askButton setTitle:@"图文咨询(￥60/次)" forState:UIControlStateNormal];
    [self addSubview:self.askButton];
    
    
}



@end
