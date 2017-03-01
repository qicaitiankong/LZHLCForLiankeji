//
//  announSecondPageNextStepView.m
//  Liankeji
//
//  Created by mac on 2017/1/16.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//
#import "announSecondPageNextStepView.h"
#import "lzhReturnView.h"
#import "announceSecondPageNextStepButt.h"
#import "announSecondPageSelectView.h"
#import "appCommonAttributes.h"
//选择控件的宽度
#define SELECT_BUTTON_WIDTH 80
//选择控件的高度
#define SELECT_BUTTON_HEIGHT 30
//各模块控件垂直方向上的间距（用的统一间距）
#define VERTICAL_SPACE 30

@implementation announSecondPageNextStepView
@synthesize commitButt;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //交付
        UILabel *payTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(30,  VERTICAL_SPACE, 100,30 )];
        payTypeLabel.text = @"交付形式：";
        [payTypeLabel sizeToFit];
        [self addSubview:payTypeLabel];
        //
        for(NSInteger i = 0 ; i < 3; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(payTypeLabel.frame.origin.x + payTypeLabel.frame.size.width + i % 3 * SELECT_BUTTON_WIDTH, payTypeLabel.frame.origin.y + i / 3 * SELECT_BUTTON_HEIGHT, SELECT_BUTTON_WIDTH, SELECT_BUTTON_HEIGHT)];
            selectView.ownContentLabe.text = @"产品";
            [self addSubview:selectView];
        }
        //专利
        UILabel *patentLabel = [[UILabel alloc]initWithFrame:CGRectMake(payTypeLabel.frame.origin.x, payTypeLabel.frame.origin.y + SELECT_BUTTON_HEIGHT * 1 + VERTICAL_SPACE, payTypeLabel.frame.size.width,payTypeLabel.frame.size.height)];
        patentLabel.text = @"专利状态：";
        [patentLabel sizeToFit];
        [self addSubview:patentLabel];
        for(NSInteger i = 0 ; i < 2; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(patentLabel.frame.origin.x + patentLabel.frame.size.width + i % 3 * SELECT_BUTTON_WIDTH, patentLabel.frame.origin.y  + i / 3 * SELECT_BUTTON_HEIGHT, SELECT_BUTTON_WIDTH, SELECT_BUTTON_HEIGHT)];
            selectView.ownContentLabe.text = @"没有";
            [self addSubview:selectView];
        }
        //技术方向
        UILabel *technologeDirectionLabe = [[UILabel alloc]initWithFrame:CGRectMake(patentLabel.frame.origin.x, patentLabel.frame.origin.y + SELECT_BUTTON_HEIGHT * 1 + VERTICAL_SPACE, patentLabel.frame.size.width,patentLabel.frame.size.height)];
        technologeDirectionLabe.text = @"技术方向：";
        [technologeDirectionLabe sizeToFit];
        [self addSubview:technologeDirectionLabe];
        for(NSInteger i = 0 ; i < 4; i ++){
            announSecondPageSelectView *selectView = [[announSecondPageSelectView alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x + technologeDirectionLabe.frame.size.width + i % 3 * SELECT_BUTTON_WIDTH, technologeDirectionLabe.frame.origin.y + i / 3 * SELECT_BUTTON_HEIGHT, SELECT_BUTTON_WIDTH, SELECT_BUTTON_HEIGHT)];
            selectView.ownContentLabe.text = @"技术方向";
            [self addSubview:selectView];
        }
        //技术亮点
        UILabel *goodTechnologeLabe = [[UILabel alloc]initWithFrame:CGRectMake(technologeDirectionLabe.frame.origin.x, technologeDirectionLabe.frame.origin.y + SELECT_BUTTON_HEIGHT * 2 + VERTICAL_SPACE, technologeDirectionLabe.frame.size.width, technologeDirectionLabe.frame.size.height)];
        goodTechnologeLabe.text = @"技术亮点：";
        [self addSubview:goodTechnologeLabe];
        UITextView *writeGoodView = [[UITextView alloc]initWithFrame:CGRectMake(goodTechnologeLabe.frame.origin.x + goodTechnologeLabe.frame.size.width, goodTechnologeLabe.frame.origin.y, self.frame.size.width - goodTechnologeLabe.frame.origin.x - goodTechnologeLabe.frame.size.width - 20, 100)];
        writeGoodView.backgroundColor = [UIColor whiteColor];
        writeGoodView.layer.borderWidth = 1;
        writeGoodView.layer.borderColor = [UIColor grayColor].CGColor;
        writeGoodView.text = @"技术亮点";
        [self addSubview:writeGoodView];
        //技术描述
        UILabel *TechnologeDescriptionLabe = [[UILabel alloc]initWithFrame:CGRectMake(goodTechnologeLabe.frame.origin.x, goodTechnologeLabe.frame.origin.y + writeGoodView.bounds.size.height + VERTICAL_SPACE, goodTechnologeLabe.bounds.size.width, goodTechnologeLabe.bounds.size.height)];
        TechnologeDescriptionLabe.text = @"技术描述：";
        [self addSubview:TechnologeDescriptionLabe];
        //
        UITextView *writeDescriptionView = [[UITextView alloc]initWithFrame:CGRectMake(writeGoodView.frame.origin.x, TechnologeDescriptionLabe.frame.origin.y, writeGoodView.bounds.size.width, writeGoodView.bounds.size.height)];
        writeDescriptionView.backgroundColor = [UIColor whiteColor];
        writeDescriptionView.layer.borderWidth = 1;
        writeDescriptionView.layer.borderColor = [UIColor grayColor].CGColor;
        [self addSubview:writeDescriptionView];
        //提交
       commitButt = [[announceSecondPageNextStepButt alloc]initWithFrame:CGRectMake(TechnologeDescriptionLabe.frame.origin.x, writeDescriptionView.frame.origin.y + writeDescriptionView.frame.size.height + 10, self.frame.size.width - 2 * TechnologeDescriptionLabe.frame.origin.x, 40)];
        [commitButt.nextButt setTitle:@"提交" forState:UIControlStateNormal];
        commitButt.previousButt.userInteractionEnabled = YES;
        commitButt.nextButt.userInteractionEnabled = YES;
         [commitButt.previousButt setBackgroundImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
         [commitButt.nextButt setBackgroundImage:[UIImage imageNamed:@"nextButton"] forState:UIControlStateNormal];
        [self addSubview:commitButt];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
