//
//  lzhZhuanjiawendaTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lzhZhuanjiawendaTableViewCell : UITableViewCell

@property (strong,nonatomic)UIButton *commentUserbutton;

@property (strong,nonatomic)UILabel *commentNameLab;

@property (strong,nonatomic)UILabel *commentJobLab;

@property (strong,nonatomic)UIButton *questionButt;

@property (strong,nonatomic)UILabel *commentTimeLab;

@property (strong,nonatomic)UILabel *questionContentLabel;

@property (strong,nonatomic)UIButton *lookButt;
//
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier contentHeight:(CGFloat)contentHeight;

@end
