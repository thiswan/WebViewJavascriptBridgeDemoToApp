//
//  LDFeedViewController.m
//  London2
//
//  Created by yaoquafeng on 15/9/24.
//  Copyright © 2015年 yaoquafeng. All rights reserved.
//

#import "LDFeedViewController.h"
#import "LDNavItems.h"
#import "HybirdAppViewController.h"

@interface LDFeedViewController ()

@end

@implementation LDFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [LDNavItems titleViewWithText:@"first"];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)goToWebViewConytoller:(id)sender {
    HybirdAppViewController *hybridVC = [[HybirdAppViewController alloc]init];
    hybridVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:hybridVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
