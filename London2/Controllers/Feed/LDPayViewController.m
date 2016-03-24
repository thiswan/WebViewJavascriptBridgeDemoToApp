//
//  LDPayViewController.m
//  London2
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 yaoquafeng. All rights reserved.
//

#import "LDPayViewController.h"

@interface LDPayViewController ()

@end

@implementation LDPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItems = [self leftBarButtonItemsWithText:@"返回" target:self action:@selector(onBack:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)payButtonAction:(id)sender {
    //调用 已知支付方式
    // 举个例子 支付宝 微信
    //因本 demo 介绍 JS ／ OC 交互就不写如何支付了了
    //    我们假设已经支付成功

    [self onPaySucc]; //支付成功 调用
}

- (void)onPaySucc {
    if (self.resultBlock) {
        self.resultBlock(YES);
        self.resultBlock = nil;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)onBack:(id)sender {
    if (self.resultBlock) {
        self.resultBlock(NO);
        self.resultBlock = nil;
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
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
    return @[ spacer, item ];
}

@end
