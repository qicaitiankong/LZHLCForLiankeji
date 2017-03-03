//
//  firstPageSecondCellGroupview.h
//  Liankeji
//
//  Created by mac on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondCellPraiseDelegate <NSObject>
//点赞
- (void)clickPraiseButton:(UILabel*)praiseLabel;
//评论
- (void)clickCommentButton:(UILabel*)commentLabel;
//举报
- (void)clickJuBaoButton:(UILabel *)JuBaoLabel;
@end

@interface firstPageSecondCellGroupview : UIView

@property (strong,nonatomic)UIButton *leftButt;

@property (strong,nonatomic)UILabel *rightLabel;
//
@property (assign,nonatomic)id<secondCellPraiseDelegate>targetDelegate;

@end
