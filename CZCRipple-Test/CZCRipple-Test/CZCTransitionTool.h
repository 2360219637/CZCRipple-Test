//
//  CZCTransitionTool.h
//  ImitationTaoBao
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CZCTransitionType) {
    CZCTransitionTypePresent,
    CZCTransitionTypeDismiss
};
@interface CZCTransitionTool : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initTransitionTool:(CZCTransitionType)modelType;
+ (instancetype)transitionTool:(CZCTransitionType)modelType;


@end
