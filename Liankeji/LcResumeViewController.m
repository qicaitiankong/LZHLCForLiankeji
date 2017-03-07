//
//  LcResumeViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcResumeViewController.h"
#import "appCommonAttributes.h"
#import "ChangeNavView.h"
#import "ResumeButton.h"
#import <Masonry.h>
#import "LcResumeTwoViewController.h"


@interface LcResumeViewController ()

@property (nonatomic,strong) ChangeNavView *changeNavView;

@end

@implementation LcResumeViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //设置底层颜色
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
}


#pragma mark - 创建视图
- (void)createView{
    
    //添加导航栏
    ChangeNavView *changeView = [[ChangeNavView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44) andTitle:self.titleText];
    [changeView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [changeView.preservationButton addTarget:self action:@selector(preservationButton) forControlEvents:UIControlEventTouchUpInside];
    self.changeNavView = changeView;
    [self.view addSubview:self.changeNavView];
    
    //添加底部选择按钮
    ResumeButton *educationResumeButton = [[ResumeButton alloc]initWithFrame:CGRectMake(0, 0.9*SCREEN_HEIGHT, SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.1)];
    [educationResumeButton addTarget:self action:@selector(toEducation) forControlEvents:UIControlEventTouchUpInside];
    educationResumeButton.tLabel.text = @"教育背景";
    [self.view addSubview:educationResumeButton];
    
    ResumeButton *experationResumeButton = [[ResumeButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.5, educationResumeButton.frame.origin.y, educationResumeButton.frame.size.width, educationResumeButton.frame.size.height)];
    [experationResumeButton addTarget:self action:@selector(toExperation) forControlEvents:UIControlEventTouchUpInside];
    experationResumeButton.tLabel.text = @"工作经历";
    [self.view addSubview:experationResumeButton];
}

#pragma mark - 跳转到教育选择界面+跳转到工作经历选择界面
- (void)toEducation{

    LcResumeTwoViewController *resumeTwoController = [[LcResumeTwoViewController alloc]init];
    resumeTwoController.judgeOfType = YES;
    resumeTwoController.judgeOfDelete = NO;
    [self presentViewController:resumeTwoController animated:YES completion:nil];
}

- (void)toExperation{
    
    LcResumeTwoViewController *resumeTwoController = [[LcResumeTwoViewController alloc]init];
    resumeTwoController.judgeOfType = NO;
    resumeTwoController.judgeOfDelete = NO;
    [self presentViewController:resumeTwoController animated:YES completion:nil];
}

#pragma mark - 返回按钮+保存按钮点击方法
- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)preservationButton{
    
    
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
