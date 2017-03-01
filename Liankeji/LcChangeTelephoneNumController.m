//
//  LcChangeTelephoneNumController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcChangeTelephoneNumController.h"
#import "appCommonAttributes.h"
#import "ChangeNavView.h"
#import <Masonry.h>

//底层文字颜色
#define COLOROFBOTTOMWORD   RGBA(56, 56, 56, 0.7)

@interface LcChangeTelephoneNumController ()

//导航栏
@property (nonatomic,strong) ChangeNavView *changeView;
//用户手机号
@property (nonatomic,strong) UITextField *phoneTextField;
//验证码
@property (nonatomic,strong) UITextField *codeTextField;
//获取验证码按钮
@property (nonatomic,strong) UIButton *getCodeButton;
//提交验证按钮
@property (nonatomic,strong) UIButton *submiteButton;

@end

@implementation LcChangeTelephoneNumController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加视图
    [self createView];
}

#pragma mark - 添加视图
- (void)createView{
    
    //添加子视图
    self.changeView = [[ChangeNavView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44) andTitle:@"更换电话"];
    [self.changeView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.changeView.preservationButton addTarget:self action:@selector(preservationButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.changeView];
    
    UILabel *label = [[UILabel alloc]init];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5;
    label.layer.borderWidth = 0.5;
    label.layer.borderColor = [UIColor colorWithRed:0/255.0 green:177/255.0 blue:251/255.0 alpha:1].CGColor;
    label.text = @"+86";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = COLOROFBOTTOMWORD;
    [self.view addSubview:label];
    
    self.phoneTextField = [[UITextField alloc]init];
    self.phoneTextField.layer.masksToBounds = YES;
    self.phoneTextField.layer.cornerRadius = 5;
    self.phoneTextField.layer.borderWidth = 0.5;
    self.phoneTextField.layer.borderColor = [UIColor colorWithRed:0/255.0 green:177/255.0 blue:251/255.0 alpha:1].CGColor;
    self.phoneTextField.placeholder = @"请填写手机号码";
    [self.view addSubview:self.phoneTextField];
    
    self.codeTextField = [[UITextField alloc]init];
    self.codeTextField.layer.masksToBounds = YES;
    self.codeTextField.layer.cornerRadius = 5;
    self.codeTextField.layer.borderWidth = 0.5;
    self.codeTextField.layer.borderColor = [UIColor colorWithRed:0/255.0 green:177/255.0 blue:251/255.0 alpha:1].CGColor;
    self.codeTextField.placeholder = @"请填写验证码";
    [self.view addSubview:self.codeTextField];
    
    self.getCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.getCodeButton.layer.masksToBounds = YES;
    self.getCodeButton.layer.cornerRadius = 5;
    [self.getCodeButton setBackgroundColor:[UIColor orangeColor]];
    [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:self.getCodeButton];
    
    self.submiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.submiteButton.layer.masksToBounds = YES;
    self.submiteButton.layer.cornerRadius = 5;
    [self.submiteButton setBackgroundColor:[UIColor orangeColor]];
    [self.submiteButton setTitle:@"提交验证" forState:UIControlStateNormal];
    [self.view addSubview:self.submiteButton];
    
    //开始布局
    WS(ws);
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.changeView.mas_bottom).with.offset(20);
        make.left.mas_equalTo(ws.view).with.offset(20);
        make.width.mas_equalTo(ws.view).multipliedBy(0.2);
        make.height.mas_equalTo(30);
    }];
    
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.height.mas_equalTo(label);
        make.left.mas_equalTo(label.mas_right);
        make.right.mas_equalTo(ws.view).with.offset(-20);
    }];
    
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.phoneTextField.mas_bottom).with.offset(20);
        make.left.mas_equalTo(label);
        make.right.height.mas_equalTo(ws.phoneTextField);
    }];
    
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.getCodeButton.mas_bottom).with.offset(50);
        make.left.right.height.mas_equalTo(ws.getCodeButton);
    }];
    
    [self.submiteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.codeTextField.mas_bottom).with.offset(20);
        make.left.right.height.mas_equalTo(ws.codeTextField);
    }];
}

#pragma mark-手机号码的正则表达式
- (BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13、15、18开头，八个\d数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

#pragma mark - 返回按钮+保存按钮点击方法
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
