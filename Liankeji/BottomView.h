//
//  BottomView.h
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LcBottomButton.h"

@interface BottomView : UIView

//关注
@property (nonatomic,strong) LcBottomButton *followButton;
//打赏
@property (nonatomic,strong) LcBottomButton *rewardButton;
//咨询
@property (nonatomic,strong) UIButton *askButton;

@end
