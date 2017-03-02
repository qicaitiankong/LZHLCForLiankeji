//
//  BasicMessageCell.m
//  Liankeji
//
//  Created by liuchen on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "BasicMessageCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation BasicMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andImageName:(NSString *)imageName andText:(NSString *)labelText{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建视图
        self.picImageView = [[UIImageView alloc]init];
        self.picImageView.image = [UIImage imageNamed:imageName];
        [self addSubview:self.picImageView];
        
        self.tLabel = [[UILabel alloc]init];
        self.tLabel.font = [UIFont systemFontOfSize:15];
        self.tLabel.text = labelText;
        if ([self.tLabel.text isEqualToString:@"基本信息"]) {
            self.tLabel.textColor = RGBA(19, 139, 216, 1);
        }else{
            self.tLabel.textColor = RGBA(242, 67, 0, 1);
        }
        [self addSubview:self.tLabel];
        
        //开始布局
        WS(ws);
        [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws).with.offset(10);
            make.centerY.mas_equalTo(ws);
            make.width.height.mas_equalTo(ws.mas_height).multipliedBy(0.35);
        }];
        
        [self.tLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.picImageView.mas_right).with.offset(10);
            make.centerY.with.height.mas_equalTo(ws.picImageView);
        }];
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
