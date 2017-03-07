//
//  BasicMessageCell.h
//  Liankeji
//
//  Created by liuchen on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicMessageCell : UITableViewCell

@property (nonatomic,strong) UIImageView *picImageView;
@property (nonatomic,strong) UILabel *tLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andImageName:(NSString *)imageName andText:(NSString *)labelText;

@end
