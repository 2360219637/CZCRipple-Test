//
//  ViewController.m
//  CZCRipple-Test
//
//  Created by 陈志超 on 2017/2/16.
//  Copyright © 2017年 huaban. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
#import "CZCRippleTool.h"
CGFloat const offsetY = 60;
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) CZCRippleTool *rippleTool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    frame.origin.y -= offsetY;
    frame.size.height += offsetY;
    self.tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    self.headerView.backgroundColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = self.headerView;
    
    //添加波纹
    CZCRippleTool *rippleTool = [CZCRippleTool rippleToolWithOriginView:self.headerView];
    rippleTool.offsetY = offsetY;
    [rippleTool start];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < -offsetY) {
        SecondController *vc = [SecondController new];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
@end

