//
//  lzhFirstPageFindZhuanjiaTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//找专家cell

#import <UIKit/UIKit.h>

@interface lzhFirstPageFindZhuanjiaTableViewCell : UITableViewCell

@property (strong,nonatomic)UIButton *userButt;

@property (strong,nonatomic)UILabel *userNameLabel;

@property (strong,nonatomic)UILabel *jobLabel;

@property (strong,nonatomic)UILabel *homePlace;
//
@property (strong,nonatomic)UILabel *contentLabel;
//
@property (strong,nonatomic)UILabel *beginMoneyLabel;

@property (strong,nonatomic)UILabel *purchasePersonNumberLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentLabelHeight:(CGFloat)height;


@end
