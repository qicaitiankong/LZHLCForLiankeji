//
//  LCSetView.h
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSetView : UIView

@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *nameLabel;

- (instancetype)initWithFrame:(CGRect)frame andSource:(NSDictionary *)dic;

@end
