//
//  personalFirstPageViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/18.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "personalFirstPageViewController.h"
#import "personalViewOfFirstPage.h"
#import "PersonalTableViewCell.h"
#import "appCommonAttributes.h"
#import "personalFirstPageUserTableViewCell.h"
#import "LZHTabBarController.h"
#import "JumpView.h"
#import <MessageUI/MessageUI.h>
#import "LCSetViewController.h"

#import "LcPersonalMessageViewController.h"
#import "AnnounceMessageViewController.h"
#import "AnswerOfExpertsViewController.h"

@interface personalFirstPageViewController ()<UITableViewDelegate,UITableViewDataSource,JumpViewPassMessageDelegate,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate>{
    personalViewOfFirstPage *secondHeaderView;
    UITableView *ownTableView;
    UIView *spaceView;
    UIView *spaceView2;
    //组头图片及标题数组
    NSArray *secondSectionImageArr;
    NSArray *secondSectionTitleArr;
    NSArray *thirdSectionImageArr;
    NSArray *thirdSectionTitleArr;
    NSArray *fourthSectionImageArr;
    NSArray *fourthSectionTitleArr;
    //客服视图
    JumpView *jumpView;
}
@end

@implementation personalFirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(246, 246, 246, 1);
    secondSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageMyMessage"],[UIImage imageNamed:@"personalFirstPageMyPraise"],[UIImage imageNamed:@"personalFirstPageMyCollection"]];
     secondSectionTitleArr = @[@"我的消息",@"我的点赞",@"我的收藏"];

     thirdSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageMyWallet"],[UIImage imageNamed:@"personalFirstPageMyJifen"],[UIImage imageNamed:@"personalFirstPageMemberCenter"]];
    thirdSectionTitleArr = @[@"我的钱包",@"我的积分",@"会员中心"];
    fourthSectionImageArr = @[[UIImage imageNamed:@"personalFirstPageCustomer"],[UIImage imageNamed:@"personalFirstPageUs"],[UIImage imageNamed:@"personalFirstPageUs.png"]];
    fourthSectionTitleArr = @[@"客服中心",@"关于我们",@"设置"];
    
    secondHeaderView = [[personalViewOfFirstPage alloc]initWithFrame:CGRectMake(0, - SCREEN_HEIGHT * 0.089, self.view.frame.size.width, SCREEN_HEIGHT * 0.089) numArr:@[@"123",@"23",@"322"] titleArray:@[@"发布的消息",@"关注",@"粉丝"]];
    spaceView = [[UIView alloc]initWithFrame:CGRectMake(0,  - SCREEN_HEIGHT * 0.02, self.view.frame.size.width, SCREEN_HEIGHT * 0.02)];
    spaceView.backgroundColor = RGBA(246, 246, 246, 1);
    spaceView2 = [[UIView alloc]initWithFrame:CGRectMake(0,  - SCREEN_HEIGHT * 0.02, self.view.frame.size.width, SCREEN_HEIGHT * 0.02)];
    spaceView2.backgroundColor = RGBA(246, 246, 246, 1);
    [self initTableView];
    
    // Do any additional setup after loading the view.
}


- (void)initTableView{
    ownTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT - NAVIGATION_HEIGHT - TABBAR_HEIGHT) style:UITableViewStyleGrouped];
    ownTableView.backgroundColor = RGBA(246, 246, 246, 1);
    ownTableView.delegate = self;
    ownTableView.dataSource = self;
    //ownTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //ownTableView.separatorColor = [UIColor grayColor];
    [self.view addSubview:ownTableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger myRows = 0;
    switch (section) {
        case 0:
            myRows = 1;
            break;
        case 1:
            myRows = 3;
            break;
        case 2:
            myRows = 3;
            break;
        case 3:
            myRows = 3;
            break;
        default:
            break;
    }
    
    return myRows;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if(indexPath.section == 0){
        personalFirstPageUserTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"personalCell1"];
        if(nil == cell){
            cell1 = [[personalFirstPageUserTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell1" _tableview:tableView];
        }
        //cell1.userImageView.image = ;
        cell1.userNameLabel.text = @"李自豪";
        cell1.jobLabel.text = @"私营业主";
        cell1.memberImageView.image = [UIImage imageNamed:@"personalFirstPageMember"];
        cell1.memberNameLabel.text = @"黄金会员";
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        cell = cell1;
    }else{
        PersonalTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"personalCell2"];
        if(nil == cell2){
            cell2 = [[PersonalTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"personalCell2" _tableview:tableView];
        }
        NSArray *imageArr = nil;
        NSArray *titleArray = nil;
        switch (indexPath.section) {
            case 1:
                imageArr = secondSectionImageArr;
                titleArray = secondSectionTitleArr;
                break;
            case 2:
                imageArr = thirdSectionImageArr;
                titleArray = thirdSectionTitleArr;
                break;
            case 3:
                imageArr = fourthSectionImageArr;
                titleArray = fourthSectionTitleArr;
                break;
            default:
                break;
        }
        [cell2.firstImageView setImage:imageArr[indexPath.row]];
        [cell2.secondTitleLable setText:titleArray[indexPath.row]];
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        cell = cell2;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight = 0;
    if(indexPath.section == 0){
        rowHeight = SCREEN_HEIGHT * 0.107;
    }else{
        rowHeight = SCREEN_HEIGHT * 0.073;
    }
    return rowHeight;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *sectionView = nil;
    switch (section) {
        case 0:
            //没有组头
            break;
        case 1:
            return secondHeaderView;
            break;
        case 2:
            return spaceView;
            break;
        case 3:
            return spaceView2;
            break;
        default:
            break;
    }
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    NSInteger height = 0;
    switch (section) {
        case 0:
            height = 0;
            break;
        case 1:
            height = secondHeaderView.frame.size.height;
            break;
        case 2:
            height = spaceView.frame.size.height;
            break;
        case 3:
            height = spaceView.frame.size.height;
            break;
        default:
            break;
    }
    return height;
}

#pragma mark - cell点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.section) {
        case 0:{
            LcPersonalMessageViewController *personalMessageController = [[LcPersonalMessageViewController alloc]init];
            [self presentViewController:personalMessageController animated:YES completion:nil];
        }
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            switch (indexPath.row) {
                case 0:{
                    //添加数据
                    NSArray *textArray = @[@"短信",@"QQ",@"客服热线",@"邮箱"];
                    NSArray *imageArray = @[@"a1.png",@"a1.png",@"a1.png",@"a1.png"];
                    jumpView = [[JumpView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) andTitleArray:textArray andImageArray:imageArray];
                    [self.view addSubview:jumpView];
                    //创建代理
                    jumpView.jumpDelegate = self;
                }
                    break;
                case 1:{
                    AnswerOfExpertsViewController *answerOfExpertsViewController = [[AnswerOfExpertsViewController alloc]init];
                    [self presentViewController:answerOfExpertsViewController animated:YES completion:nil];
                }
                    break;
                case 2:
                    [self presentViewController:[LCSetViewController new] animated:YES completion:nil];
                    
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

#pragma mark - 代理实现方法
//删除客服中心功能视图
- (void)remove{

    //简单的动画效果
    [UIView animateWithDuration:0.5 animations:^{
        jumpView.alpha=0;
    } completion:^(BOOL finished) {
        [jumpView removeFromSuperview];
    }];
}
//实现客服中心响应功能
- (void)acitonOpen:(UIButton *)button{
    
    switch (button.tag) {
            //短信
        case 100001:
            [self sendMessage];
            break;
            //QQ
        case 100002:
            [self openQQ];
            break;
            //客服热线
        case 1000032:
            [self phoneSend];
            break;
            //邮箱
        case 100004:
            [self mailOpen];
            break;
        default:
            break;
    }
}


#pragma mark - 发送短信
- (void)sendMessage{
    
    //用于判断是否有发送短信的功能（模拟器上就没有短信功能）
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    //判断是否有短信功能
    if (messageClass != nil) {
        //实例化MFMessageComposeViewController,并设置委托
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.delegate = self;
        //设置发送给谁
        messageController.recipients = @[@"18363802529"];
        //推到发送试图控制器
        [self presentViewController:messageController animated:YES completion:^{
            
        }];
    }else{
        [self showOKAlertWithMessage:@"该设备无法发送短信,请检查"];
    }
}
#pragma mark - QQ
- (void)openQQ{
    
    //是否安装QQ
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]])
    {
        //用来接收临时消息的客服QQ号码(注意此QQ号需开通QQ推广功能,否则陌生人向他发送消息会失败)
        NSString *QQ = @"1246158996";
        //调用QQ客户端,发起QQ临时会话
        NSString *url = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",QQ];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }else{
        //跳转到QQ下载界面
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms://itunes.apple.com/cn/app/qq/id451108668?mt=12"]];
    }
}
#pragma mark - 客服热线
- (void)phoneSend{
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"18363802529"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}
#pragma mark - 邮箱
- (void)mailOpen{

    if ([MFMailComposeViewController canSendMail]) { // 用户已设置邮件账户
        
    }else{
        [self showOKAlertWithMessage:@"请登录您的邮件帐户来发送电子邮件"];
        return;
    }
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [self presentViewController:mailComposer animated:YES completion:nil];
}


#pragma mark - 系统短信+邮件回调方法
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    NSString *tipContent;
    switch (result) {
        case MessageComposeResultCancelled:
            tipContent = @"发送短信已";
            break;
        case MessageComposeResultFailed:
            tipContent = @"发送短信失败";
            break;
        case MessageComposeResultSent:
            tipContent = @"发送成功";
            break;
        default:
            break;
    }
    [self showOKAlertWithMessage:tipContent];
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %ld",(long)result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    switch (result)
    {
        case MFMailComposeResultCancelled: // 用户取消编辑
            [self showOKAlertWithMessage:@"用户取消编辑"];
            break;
        case MFMailComposeResultSaved: // 用户保存邮件
            [self showOKAlertWithMessage:@"用户保存邮件"];
            break;
        case MFMailComposeResultSent: // 用户点击发送
            [self showOKAlertWithMessage:@"用户点击发送"];
            break;
        case MFMailComposeResultFailed: // 用户尝试保存或发送邮件失败
            [self showOKAlertWithMessage:@"用户尝试保存或发送邮件失败"];
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 提示窗口
- (void)showOKAlertWithMessage:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
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
