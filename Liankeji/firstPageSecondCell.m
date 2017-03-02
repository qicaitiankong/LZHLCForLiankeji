//
//  firstPageHeaderCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中科技头条的CELL

#import "firstPageSecondCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>


@implementation firstPageSecondCell
@synthesize viewModel1;
@synthesize contentLabel;
@synthesize groupView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView changeLabelHeight:(CGFloat)height{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //self.backgroundColor = [UIColor grayColor];
        //
         viewModel1 = [[lzhFirstpageSecondCellView1 alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 50)];
        [self.contentView addSubview:viewModel1];
        //
        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, viewModel1.frame.origin.y + viewModel1.frame.size.height, _tableView.frame.size.width - 2 * 5, height)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.backgroundColor = [UIColor whiteColor];
        contentLabel.textColor = [UIColor colorWithRed:161 / 255 green:161 / 255 blue:161 / 255 alpha:1];
        [self.contentView addSubview:contentLabel];
        //
        groupView = [[firstPageSecondCellGroupview alloc]initWithFrame:CGRectMake(0, contentLabel.frame.origin.y + contentLabel.frame.size.height + 5, _tableView.frame.size.width, 20)];
        [self.contentView addSubview:groupView];
        //
        lzhFirstPageSecondCellCommentView *commentView = [[lzhFirstPageSecondCellCommentView alloc]initWithFrame:CGRectMake(5, groupView.frame.origin.y + groupView.frame.size.height + 5, _tableView.frame.size.width - 2 * 5, SCREEN_HEIGHT * 0.287)];
        [self.contentView addSubview:commentView];
        
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
