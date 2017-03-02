//
//  firstPageHeaderCell.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//首页的第二个CELL

#import <UIKit/UIKit.h>
#import "appCommonAttributes.h"
#import "lzhFirstpageSecondCellView1.h"
#import "firstPageSecondCellGroupview.h"
#import "lzhFirstPageSecondCellCommentView.h"

@interface firstPageSecondCell : UITableViewCell
//
@property (strong,nonatomic)lzhFirstpageSecondCellView1 *viewModel1;
//
@property (strong,nonatomic)UILabel *contentLabel;
//
@property (strong,nonatomic)firstPageSecondCellGroupview *groupView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView changeLabelHeight:(CGFloat)height;

@end
