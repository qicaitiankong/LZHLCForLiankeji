//
//  AnnounceMessageView.h
//  Liankeji
//
//  Created by liuchen on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDImageCache.h"
#import "ChangeNavView.h"

@interface AnnounceMessageView : UIView

@property (nonatomic,strong) UITextView *textView;
//@property (nonatomic,strong) MKMessagePhotoView *photosView;
@property (nonatomic,strong) ChangeNavView *navView;
//选择图片按钮
@property (nonatomic,strong) UIButton *selectButton;
//展示图片scrollView
@property (nonatomic,strong) UIScrollView *picScrollView;

@end
