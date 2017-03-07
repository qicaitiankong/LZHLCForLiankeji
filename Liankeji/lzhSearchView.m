//
//  lzhSearchView.m
//  Liankeji
//
//  Created by mac on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhSearchView.h"
#import <Masonry.h>
#import "appCommonAttributes.h"

@interface lzhSearchView (){
    UITextField *searchField;
    
}
@end

@implementation lzhSearchView
//
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        [imageView setImage:[UIImage imageNamed:@"nav2"]];
        imageView.backgroundColor = [UIColor grayColor];
        [self addSubview:imageView];
        //
        searchField = [[UITextField alloc]initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 5, 5, 260, self.frame.size.height - 10)];
        searchField.backgroundColor = [UIColor whiteColor];
        searchField.layer.cornerRadius = 10;
        [self addSubview:searchField];
        //
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        searchButton.frame = CGRectMake(searchField.frame.origin.x + searchField.frame.size.width + 5, searchField.frame.origin.y, 50, searchField.frame.size.height);
        UIColor *color = RGBA(252, 177, 44, 1);
        [searchButton setTitleColor:color forState:UIControlStateNormal];
        [searchButton setTitle:@"搜索" forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:searchButton];
        //
       
        [searchField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self).multipliedBy(0.65);
            make.width.mas_equalTo(self).multipliedBy(0.7);
            make.center.mas_equalTo(self);
        }];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self).multipliedBy(0.6);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(imageView.mas_height);
            make.right.mas_equalTo(searchField.mas_left).offset(-5);
        }];
       //
        [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(searchField.mas_right).offset(5);
            make.right.mas_equalTo(self);
            make.height.mas_equalTo(searchField);
            make.centerY.mas_equalTo(self);
        }];
        //
    }
    return self;
}

- (void)searchButtonHandler:(UIButton*)_b{
    if([searchField isFirstResponder]){
        [searchField resignFirstResponder];
    }
    if(self.targetDele){
        [self.targetDele clickSearchButt:_b];
    }
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
