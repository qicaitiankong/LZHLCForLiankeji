//
//  AnswerOfExpertsViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/6.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AnswerOfExpertsViewController.h"
#import "PromptView.h"
#import "LcActionButton.h"
#import "LcAskView.h"
#import "appCommonAttributes.h"
#import "BottomView.h"
#import <Masonry.h>

//底部背景颜色
#define COLORWITHANSWERCONTROLLER RGBA(230, 230, 230, 1)

@interface AnswerOfExpertsViewController ()

@property (nonatomic,strong) LcAskView *askView;
@property (nonatomic,strong) PromptView *promptView;
@property (nonatomic,strong) BottomView *bottomView;

@end

@implementation AnswerOfExpertsViewController

- (void)viewWillAppear:(BOOL)animated{

    self.view.backgroundColor = COLORWITHANSWERCONTROLLER;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建视图
    [self createView];
}


#pragma mark - 创建视图
- (void)createView{

    //添加子视图
    self.askView = [[LcAskView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT*0.35) andDic:nil];
    [self.askView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.askView];
    
    NSArray *nameArray = @[@"图文咨询",@"视频咨询",@"视频电话"];
    NSArray *priceArray = @[@"￥60/次",@"￥10/分钟",@"￥20/分钟"];
    NSArray *imageArray = @[@"图文.png",@"视频.png",@"电话.png"];
    for (int i=0; i<3; i++) {
        LcActionButton *actionButton = [[LcActionButton alloc]initWithFrame:CGRectMake(i*SCREEN_WIDTH/3.0, self.askView.frame.size.height+STATUSBAR_HEIGHT, SCREEN_WIDTH/3.0, SCREEN_HEIGHT*0.2) andNum:i];
        actionButton.tag = 110000+i;
        actionButton.picImageView.image = [UIImage imageNamed:imageArray[i]];
        [actionButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        actionButton.nameLabel.text = nameArray[i];
        actionButton.priceLabel.text = priceArray[i];
        [self.view addSubview:actionButton];
    }
    
    self.promptView = [[PromptView alloc]initWithFrame:CGRectMake(0, self.askView.frame.size.height+SCREEN_HEIGHT*0.2+1+STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT*0.05)];
    self.promptView.picImageView.image = [UIImage imageNamed:@"小logo.png"];
    [self.view addSubview:self.promptView];
    
    UILabel *introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.promptView.frame.size.height+self.promptView.frame.origin.y+20, SCREEN_WIDTH, self.promptView.frame.size.height)];
    introduceLabel.backgroundColor = [UIColor whiteColor];
    introduceLabel.text = @"  专家简介";
    introduceLabel.textColor = [UIColor blackColor];
    introduceLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:introduceLabel];
    
    UILabel *jieshaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, introduceLabel.frame.size.height+introduceLabel.frame.origin.y+1, SCREEN_WIDTH, self.promptView.frame.size.height)];
    jieshaoLabel.text = @"  主攻医疗方面,对于微创技术有自己独特的见解";
    jieshaoLabel.backgroundColor = [UIColor whiteColor];
    jieshaoLabel.textColor = [UIColor blackColor];
    jieshaoLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:jieshaoLabel];
    
    self.bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.9, SCREEN_WIDTH, SCREEN_HEIGHT*0.1)];
    [self.view addSubview:self.bottomView];
}

#pragma mark - button点击方法
- (void)change:(UIButton *)button{
    
    switch (button.tag) {
        case 110000:
            [self.bottomView.askButton setTitle:@"文字咨询" forState:UIControlStateNormal];
            break;
        case 110001:
            [self.bottomView.askButton setTitle:@"视频咨询" forState:UIControlStateNormal];
            break;
        case 110002:
            [self.bottomView.askButton setTitle:@"电话咨询" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}


#pragma mark - 返回
- (void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
