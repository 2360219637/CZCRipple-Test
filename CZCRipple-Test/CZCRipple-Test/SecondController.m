//
//  SecondController.m
//  ImitationTaoBao
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 秦传龙. All rights reserved.
//

#import "SecondController.h"
#import "CZCTransitionTool.h"
@interface SecondController ()<UIViewControllerTransitioningDelegate>

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [CZCTransitionTool transitionTool:CZCTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [CZCTransitionTool transitionTool:CZCTransitionTypeDismiss];
}
- (void)disMiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
