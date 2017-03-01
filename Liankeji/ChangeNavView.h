//
//  ChangeNavView.h
//  Liankeji
//
//  Created by liuchen on 2017/2/28.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeNavView : UIView

@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *tLabel;
@property (nonatomic,strong) UIButton *preservationButton;
@property (nonatomic,copy) NSString *changeText;

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

@end
