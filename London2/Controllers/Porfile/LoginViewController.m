//
//  LoginViewController.m
//  London2
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 yaoquafeng. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"login";
    self.navigationItem.leftBarButtonItems = [self leftBarButtonItemsWithText:@"取消" target:self action:@selector(dismissSelf:)];    // Do any additional setup after loading the view from its nib.
}

- (NSArray *)leftBarButtonItemsWithText:(NSString *)text target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [btn setTitle:text forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -15.0f;
    return @[spacer,item];
}

- (void)dismissSelf:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{ }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
