//
//  JumpButton.h
//  Liankeji
//
//  Created by liuchen on 2017/2/24.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JumpButton : UIButton

@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *nameLabel;

-(instancetype)initWithFrame:(CGRect)frame andText:(NSString *)text andImageName:(NSString *)imageName;

@end
