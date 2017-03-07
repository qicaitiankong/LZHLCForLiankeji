//
//  LcAskView.h
//  Liankeji
//
//  Created by liuchen on 2017/3/4.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LcAskView : UIView

//标题按钮
@property (nonatomic,strong) UILabel *tLabel;
//返回按钮
@property (nonatomic,strong) UIButton *backButton;
//头像
@property (nonatomic,strong) UIImageView *picImageView;
//名字
@property (nonatomic,strong) UILabel *nameLabel;
//擅长领域
@property (nonatomic,strong) UILabel *fieldLabel;
//咨询人数
@property (nonatomic,strong) UILabel *numOfLabel;
//好评率
@property (nonatomic,strong) UILabel *praiseOfLabel;
//同行认可
@property (nonatomic,strong) UILabel *approvalOfLabel;

- (instancetype)initWithFrame:(CGRect)frame andDic:(NSDictionary *)dic;

@end
