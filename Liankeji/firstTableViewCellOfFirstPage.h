//
//  firstTableViewCell.h
//  Liankeji
//
//  Created by mac on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface firstTableViewCellOfFirstPage : UITableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier delegate:(id)targetDelegate cellHeight:(CGFloat)height announceArr:(NSArray*)announceArr tableView:(UITableView*)tableView;

@end
