//
//  AnnounceMessageView.m
//  Liankeji
//
//  Created by liuchen on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AnnounceMessageView.h"
#import "appCommonAttributes.h"
#import <Masonry.h>

#define WIDTHANDHEIGHT 80

@implementation AnnounceMessageView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //创建视图
        [self createAnnounceView];
    }
    return self;
}

#pragma mark - 创建视图
- (void)createAnnounceView{

    self.backgroundColor = [UIColor whiteColor];
    //添加子视图
    self.navView = [[ChangeNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUSBAR_HEIGHT+44) andTitle:nil];
    [self addSubview:self.navView];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, self.navView.frame.size.height, SCREEN_WIDTH, self.frame.size.height-self.navView.frame.size.height-100)];
    [self addSubview:self.textView];
    
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectButton setImage:[UIImage imageNamed:@"添加照片.png"] forState:UIControlStateNormal];
    [self addSubview:self.selectButton];

    self.picScrollView = [[UIScrollView alloc]init];
    self.picScrollView.backgroundColor = [UIColor redColor];
    self.picScrollView.contentSize = CGSizeMake(WIDTHANDHEIGHT*12, WIDTHANDHEIGHT);
    [self addSubview:self.picScrollView];
    
    //添加布局
    WS(ws);
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).with.offset(10);
        make.top.mas_equalTo(ws.textView.mas_bottom).with.offset(50-WIDTHANDHEIGHT/2.0);
        make.height.width.mas_equalTo(WIDTHANDHEIGHT);
    }];
    
    [self.picScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(ws.mas_right).with.offset(-10);
        make.top.mas_equalTo(ws.selectButton);
        make.width.mas_equalTo(SCREEN_WIDTH-20-WIDTHANDHEIGHT-5);
        make.height.mas_equalTo(WIDTHANDHEIGHT);
    }];
}
















@end
