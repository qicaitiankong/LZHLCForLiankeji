//
//  lzhScienceDetaileCommentTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lzhScienceDetaileCommentTableViewCell : UITableViewCell

@property (strong,nonatomic)UIButton *commentUserbutton;


@property (strong,nonatomic)UILabel *commentNameLab;

@property (strong,nonatomic)UILabel *commentJobLab;

@property (strong,nonatomic)UILabel *commentTimeLab;

@property (strong,nonatomic)UILabel *commentContentLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentLabelHeight:(CGFloat)contentHeight;

@end
