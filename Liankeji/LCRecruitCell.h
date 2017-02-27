//
//  LCRecruitCell.h
//  Liankeji
//
//  Created by liuchen on 2017/2/22.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lzhFindJobCellSmallView.h"

@interface LCRecruitCell : UITableViewCell

@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *tLabel;
@property (nonatomic,strong) UILabel *wagesLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic,strong) NSDictionary *LCRecruitDic;

@property (nonatomic,strong) lzhFindJobCellSmallView *adressView;
@property (nonatomic,strong) lzhFindJobCellSmallView *educationview;

@end
