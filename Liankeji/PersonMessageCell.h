//
//  PersonMessageCell.h
//  Liankeji
//
//  Created by liuchen on 2017/2/28.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonMessageCell : UITableViewCell


@property (nonatomic,strong) UILabel *tLabel;
@property (nonatomic,strong) UIImageView *picImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
