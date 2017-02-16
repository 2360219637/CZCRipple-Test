//
//  CZCTransitionTool.m
//  ImitationTaoBao
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import "CZCTransitionTool.h"
@interface CZCTransitionTool()
@property (nonatomic, assign) CZCTransitionType modelType;
@end
@implementation CZCTransitionTool
- (instancetype)initTransitionTool:(CZCTransitionType)modelType{
    if (self = [super init]) {
        self.modelType = modelType;
    }
    return self;
}
+ (instancetype)transitionTool:(CZCTransitionType)modelType {
    return [[[self class] alloc]initTransitionTool:modelType];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    if (self.modelType == CZCTransitionTypePresent) {
        [self present:transitionContext];
    } else {
        [self dismiss:transitionContext];
    }
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 0.5;
}

- (void)present:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromeView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromeView];
    [containerView addSubview:toView];
    
    fromeView.frame = containerView.frame;
    toView.frame = CGRectMake(0, -containerView.frame.size.height, containerView.frame.size.width, containerView.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromeView.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, containerView.frame.size.height);
        toView.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    
}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromeView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:fromeView];
    [containerView addSubview:toView];
    
    fromeView.frame = containerView.frame;
    toView.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, containerView.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromeView.frame = CGRectMake(0, -containerView.frame.size.height, containerView.frame.size.width, containerView.frame.size.height);
        toView.frame = CGRectMake(0, 0, containerView.frame.size.width, containerView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
        
    }];
    
}
@end
