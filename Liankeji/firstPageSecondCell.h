//
//  firstPageHeaderCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//首页的第二个CELL

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import "firstPageSecondCellGroupview.h"


@interface firstPageSecondCell : UITableViewCell
//头像
@property (strong,nonatomic)UIButton *userImageButt;
//名字
@property (strong,nonatomic)UILabel *userNameLabel;
//时间
@property (strong,nonatomic)UILabel *userTimeLabel;
//内容
@property (strong,nonatomic)UILabel *contentLabel;
//评论者名字
@property (strong,nonatomic)UILabel *commentUserName;
//评论内容
@property (strong,nonatomic)UILabel *commentContentLabel;


//

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView changeLabelHeight:(CGFloat)height commentViewContentArr:(NSArray*)ContentArr dellegate:(id)delega;

@end
