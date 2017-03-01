//
//  annoounceSecondPageViewController.h
//  Liankeji
//
//  Created by mac on 2017/1/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "anounceSecondPageView.h"
#import "announceWindowView.h"


@interface annoounceSecondPageViewController : UIViewController
//窗口视图
@property (strong,nonatomic)announceWindowView *windowView;
//发布的种类
@property (strong,nonatomic)NSString *announceTypeStr;



@end
