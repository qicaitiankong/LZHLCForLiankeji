//
//  LcActionButton.h
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LcActionButton : UIButton

@property (nonatomic,strong) UIImageView *selectImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *priceLabel;

- (instancetype)initWithFrame:(CGRect)frame andNum:(NSInteger)num;

@end
