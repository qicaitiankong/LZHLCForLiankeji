//
//  returnViewForSearchViewController.m
//  Liankeji
//
//  Created by mac on 2017/2/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "returnViewForSearchViewController.h"
@interface returnViewForSearchViewController ()<UITextFieldDelegate>{
    //错号清除
    UIButton *clearButt;
}
@end

@implementation returnViewForSearchViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        //返回按钮
        self.returnButt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.returnButt setTitle:@"<<" forState:UIControlStateNormal];
        self.returnButt.frame = CGRectMake(0, 5, self.frame.size.width * 0.1, self.frame.size.height * 0.6);
         self.returnButt.center = CGPointMake(self.returnButt.center.x, self.frame.size.height / 2);
        //self.returnButt.backgroundColor = [UIColor blackColor];
        [self addSubview:self.returnButt];
        //搜索提示图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.returnButt.frame.size.width + 5, 5, self.frame.size.height * 0.5, self.frame.size.height * 0.5)];
        imageView.layer.cornerRadius = imageView.frame.size.width / 2;
        imageView.center = CGPointMake(imageView.center.x, self.frame.size.height * 0.5);
        //imageView.backgroundColor = [UIColor redColor];
        [imageView setImage:[UIImage imageNamed:@"nav2"]];
        [self addSubview:imageView];
        //搜索框
        self.searchField = [[UITextField alloc]initWithFrame:CGRectMake(imageView.frame.origin.x + imageView.frame.size.width + 5, imageView.frame.origin.y, self.frame.size.width * 0.6, self.frame.size.height * 0.6)];
        self.searchField.backgroundColor = [UIColor whiteColor];
        self.searchField.layer.cornerRadius = 5;
        self.searchField.placeholder = @"请输入搜索";
        self.searchField.center = CGPointMake(self.searchField.center.x, self.frame.size.height / 2);
        self.searchField.returnKeyType = UIReturnKeySearch;
        self.searchField.delegate = self;
        [self.searchField addTarget:self action:@selector(searchValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [self addSubview:self.searchField];
        
        //清除按钮
        clearButt = [UIButton buttonWithType:UIButtonTypeCustom];
        clearButt.frame = CGRectMake(self.searchField.frame.origin.x + self.searchField.frame.size.width + 5, self.searchField.frame.origin.y , 50, self.searchField.frame.size.height);
        clearButt.layer.cornerRadius = 5;
        [clearButt setTitle:@"清除" forState:UIControlStateNormal];
        //[clearButt setImage:[UIImage imageNamed:@"nav2"] forState:UIControlStateNormal];
        [clearButt addTarget:self action:@selector(clearButtonhHandler:) forControlEvents:UIControlEventTouchUpInside];
        clearButt.hidden = YES;
        clearButt.userInteractionEnabled = NO;
        //self.searchButt.backgroundColor = [UIColor redColor];
        [self addSubview:clearButt];
    }
    return self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //NSLog(@"开始编辑");
    if(self.targetDelegate){//历史记录
        [self.targetDelegate displaySearchHistoryView];
    }
}
//回车键搜索
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    //self.searchButt.userInteractionEnabled = YES;
    if(self.targetDelegate){//
        [self.targetDelegate clickSearch:textField];
    }
    //NSLog(@"点击了回车搜索");
    return YES;
}

//输入框内容变化
- (void)searchValueChanged:(UITextField*)textField{
    if([textField.text isEqualToString:@""]){
        clearButt.hidden = YES;
        clearButt.userInteractionEnabled = NO;
    }else{
        clearButt.hidden = NO;
        clearButt.userInteractionEnabled = YES;
    }
}
//清除
- (void)clearButtonhHandler:(UIButton*)_b{
    self.searchField.text = @"";
    clearButt.hidden = YES;
    clearButt.userInteractionEnabled = NO;
    //NSLog(@"点击了清除按钮");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
