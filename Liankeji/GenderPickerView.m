//
//  GenderPickerView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "GenderPickerView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

@implementation GenderPickerView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createGenderView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createGenderView{

    //添加数据
    self.contentArray = @[@"男",@"女"];
    
    //添加样式
    self.backgroundColor = RGBA(35, 35, 35, 0.5);
    self.userInteractionEnabled = YES;
    
    //添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOn)];
    [self addGestureRecognizer:tap];
    
    //添加子视图
    self.pickerView = [[UIPickerView alloc]init];
    self.pickerView.backgroundColor = [UIColor whiteColor];
    self.pickerView.layer.masksToBounds = YES;
    self.pickerView.layer.cornerRadius =10;
    self.pickerView.delegate =self;
    self.pickerView.dataSource =self;
    
    [self addSubview:self.pickerView];
    
    //添加布局
    WS(ws);
    [self.pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(ws);
        make.width.height.mas_equalTo(ws.mas_width).multipliedBy(0.65);
    }];
    
}

#pragma mark - 手势方法-》移除视图
- (void)tapOn{

    if (self.delegate) {
        [self.delegate removePresentView];
    }
}

#pragma mark - 协议方法
//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}
//每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 2;
}
//每列高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{

    return 50;
}
//每列宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return 100;
}
//定义每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.contentArray[row];
}
//返回选中行的内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (self.delegate) {
        [self.delegate passMessage:self.contentArray[row]];
    }
}


@end
