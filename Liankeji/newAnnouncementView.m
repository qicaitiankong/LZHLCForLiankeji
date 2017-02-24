//
//  newAnnouncementView.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/19.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "newAnnouncementView.h"
#import "appCommonAttributes.h"

@interface newAnnouncementView ()

@property (strong,nonatomic)VierticalScrollView *textScrollView;

@end

@implementation newAnnouncementView

-(instancetype)initWithFrame:(CGRect)frame announceTitleArr:(NSArray*)titleArr{
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *imageView = [[UIImageView alloc]init];
        //imageView.backgroundColor = [UIColor grayColor];
        [imageView setImage:[UIImage imageNamed:@"1_25"]];
        [self addSubview:imageView];
        //添加灰色线
        UIView *styleLine1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0 , 1, self.frame.size.height)];
        styleLine1.backgroundColor = [UIColor grayColor];
        [self addSubview:styleLine1];
        //
        //最新公告轮播
        self.textScrollView = [VierticalScrollView initWithTitleArray:titleArr AndFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width, imageView.frame.origin.y, 100, imageView.frame.size.height)];
        self.textScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.textScrollView];
        //
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(SCREEN_WIDTH * 0.047);
            make.height.equalTo(self).multipliedBy(0.6);
            make.width.equalTo(imageView.mas_height);
            make.centerY.equalTo(self);
        }];
        [styleLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).offset(1);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(imageView.mas_height);
            make.centerY.mas_equalTo(self);
        }];
        [self.textScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).offset(2);
            make.right.equalTo(self).offset(-5);
            make.height.equalTo(imageView);
            make.centerY.equalTo(self);
        }];
        //添加灰色线
        UIView *styleLine = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height - 1 , frame.size.width, 1)];
        styleLine.backgroundColor = [UIColor grayColor];
        [self addSubview:styleLine];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
