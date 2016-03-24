//
//  LDActivityViewController.m
//  London2
//
//  Created by yaoquafeng on 15/9/24.
//  Copyright © 2015年 yaoquafeng. All rights reserved.
//

#import "LDActivityViewController.h"
#import "LDNavItems.h"

@interface LDActivityViewController ()

@end

@implementation LDActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [LDNavItems titleViewWithText:@"two"];
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
