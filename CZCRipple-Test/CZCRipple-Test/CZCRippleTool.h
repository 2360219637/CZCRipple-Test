//
//  CZCRippleTool.h
//  ImitationTaoBao
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CZCRippleTool : NSObject

//初始化
- (instancetype)initWithOriginView:(UIView *)originView;
+ (instancetype)rippleToolWithOriginView:(UIView *)originView;

//波纹开始
- (void)start;

//显示的波浪数 default：1.5
@property (nonatomic,assign) CGFloat cycleNumber;

//波浪移动速度 default：0.05
@property (nonatomic,assign) CGFloat speed;

//颜色
@property (nonatomic,strong) UIColor *fillColor;

//波浪偏移量
@property (nonatomic,assign) CGFloat offsetY;

//弧度大小 default：50
@property (nonatomic,assign) CGFloat arcHeight;

//波振幅大小 defalut：4   值越大，波浪越高
@property (nonatomic,assign) CGFloat rippleAmplitude;

@end
