//
//  LDPublishViewController.m
//  London2
//
//  Created by yaoquafeng on 15/9/24.
//  Copyright © 2015年 yaoquafeng. All rights reserved.
//

#import "LDPublishViewController.h"
#import "LDNavItems.h"

@interface LDPublishViewController ()

@end

@implementation LDPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [LDNavItems titleViewWithText:@"three"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
