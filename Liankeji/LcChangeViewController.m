//
//  LcChangeViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/1.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcChangeViewController.h"
#import "appCommonAttributes.h"
#import "ChangeNavView.h"
#import <Masonry.h>

@interface LcChangeViewController ()<UITextViewDelegate>

@property (nonatomic,strong) ChangeNavView *changeNavView;
@property (nonatomic,strong) UITextView *contentTextView;

@end

@implementation LcChangeViewController


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
    
    //添加内容
    self.contentTextView = [[UITextView alloc]init];
    if ([self.titleText isEqualToString:@"邮箱"]) {
        self.contentTextView.delegate = self;
    }
    self.contentTextView.layer.masksToBounds = YES;
    self.contentTextView.layer.cornerRadius = 5;
    self.contentTextView.layer.borderWidth = 0.5;
    self.contentTextView.layer.borderColor = [UIColor colorWithRed:242/255.0 green:144/255.0 blue:91/255.0 alpha:1].CGColor;
    [self.view addSubview:self.contentTextView];
    
    UILabel *warnLabel = [[UILabel alloc]init];
    warnLabel.text = self.contentText;
    warnLabel.textColor = RGBA(56, 56, 56, 0.3);
    warnLabel.font = [UIFont systemFontOfSize:13];
    warnLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:warnLabel];
    
    //添加布局
    WS(ws);
    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.view.mas_left).with.offset(10);
        make.right.mas_equalTo(ws.view.mas_right).with.offset(-10);
        make.top.mas_equalTo(ws.changeNavView.mas_bottom).with.offset(50);
        make.height.mas_equalTo(30);
    }];
    
    [warnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.contentTextView);
        make.top.mas_equalTo(ws.contentTextView.mas_bottom).with.offset(10);
        make.width.mas_equalTo(ws.contentTextView);
        make.height.mas_equalTo(25);
    }];
}

#pragma mark - 返回按钮+保存按钮点击方法
- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)preservationButton{

    
}

#pragma mark-邮箱地址的正则表达式
- (BOOL)isValidateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


#pragma mark - phoneTextField的协议方法
- (void)textViewDidEndEditing:(UITextView *)textView{

    if (![self isValidateEmail:self.contentTextView.text]) {
        [self showOKAlertWithMessage:@"邮箱不符合格式要求"];
        self.contentTextView.text = @"";
    };
}


#pragma mark - 提示窗口
- (void)showOKAlertWithMessage:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - 屏幕自带的点击方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (![self.contentTextView.text isEqualToString:@""]) {
        if (![self isValidateEmail:self.contentTextView.text]) {
            [self showOKAlertWithMessage:@"邮箱格式不符合要求"];
            self.contentTextView.text = @"";
        };
    }
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
