//
//  lzhSearchView.h
//  Liankeji
//
//  Created by mac on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol lzhSearchDele <NSObject>

- (void)clickSearchButt:(UIButton*)_b;

@end

@interface lzhSearchView : UIView

@property (assign,nonatomic)id<lzhSearchDele>targetDele;

@end
