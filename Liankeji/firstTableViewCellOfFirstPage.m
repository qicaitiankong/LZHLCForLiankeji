//
//  firstTableViewCell.m
//  Liankeji
//
//  Created by mac on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstTableViewCellOfFirstPage.h"
#import "lzhTableHeaderViewForFirstPage.h"

@implementation firstTableViewCellOfFirstPage


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier delegate:(id)targetDelegate cellHeight:(CGFloat)height announceArr:(NSArray*)announceArr tableView:(UITableView*)tableView{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        lzhTableHeaderViewForFirstPage *view = [[lzhTableHeaderViewForFirstPage alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, height) targetDelegate:targetDelegate announceTitleArr:announceArr];
        [self.contentView addSubview:view];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
