//
//  scinenceHeaderView.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/20.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

@protocol segumentDelegate <NSObject>
- (void)clickSegumentIndex:(NSInteger)index;
@end

@interface scinenceHeaderView : UIView

@property(assign,nonatomic)id<segumentDelegate>targetDelegate;

@end
