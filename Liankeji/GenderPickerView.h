//
//  GenderPickerView.h
//  Liankeji
//
//  Created by liuchen on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>


//添加协议-》1.移除pickerView视图  2.传递pickerView选择的结果
@protocol GenderDelegate <NSObject>

- (void)passMessage:(NSString *)message;
- (void)removePresentView;

@end



@interface GenderPickerView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSArray *contentArray;

@property (nonatomic,weak)id<GenderDelegate>delegate;

@end
