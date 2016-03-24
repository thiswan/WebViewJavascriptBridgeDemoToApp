//
//  HybirdAppViewController.m
//  London2
//
//  Created by Mr.Yao on 16/3/23.
//  Copyright © 2016年 yaoquafeng. All rights reserved.
//

#import "DetailViewController.h"
#import "HyBridBridge.h"
#import "HybirdAppViewController.h"
#import "HybirdUrlHandler.h"
#import <UIView+Toast.h>
#import "LoginViewController.h"
#import "LDPayViewController.h"

@interface HybirdAppViewController () <UIWebViewDelegate, HybridUrlHanlder>

@property (nonatomic, strong) UIWebView *webView;

@property WebViewJavascriptBridge *bridge;
@property (strong, nonatomic) HyBridBridge *hybridBridge;
@property (weak, nonatomic) IBOutlet UIButton *nativeButton;

@end

@implementation HybirdAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view bringSubviewToFront:self.nativeButton];
}

#pragma mark - init Views

- (void)setupViews {
    [WebViewJavascriptBridge enableLogging];

    NSString *fileString = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSString *htmlString = [NSString stringWithContentsOfFile:fileString encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:[NSURL URLWithString:fileString]];

    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.webView];
    [self.hybridBridge registerHybridUrlHanlder:self andBridge:self.bridge];
    
    [_bridge callHandler:@"testJavascriptHandler" data:@{ @"foo":@"before ready" }];

}

#pragma mark - Getters & Setters

- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (IBAction)nativeButtonAction:(id)sender {
    id data = @{ @"greetingFromObjC": @"Hi there, JS!" };
    [_bridge callHandler:@"testJavascriptHandler" data:data responseCallback:^(id response) {
        NSLog(@"testJavascriptHandler responded: %@", response);
    }];

}

- (HyBridBridge *)hybridBridge {
    if (!_hybridBridge) {
        _hybridBridge = [[HyBridBridge alloc] init];
    }
    return _hybridBridge;
}

#pragma mark - HybridUrlHanlder

- (NSArray *)actionNames {
    return @[ @"login", @"tabbar", @"push", @"showToast", @"pay" ];
}

- (BOOL)handleDictionAry:(NSDictionary *)dictionary callback:(HybridCallbackBlock)callbackBlock {
    NSString *actionTag = dictionary[@"actionName"];
    if ([actionTag isEqualToString:@"login"]) {
        [self nativeLogin];
        return YES;
    } else if ([actionTag isEqualToString:@"tabbar"]) {
        [self nativeAppHome:[dictionary[@"tab"] intValue]];
        return YES;
    } else if ([actionTag isEqualToString:@"push"]) {
        [self nativePushSubViewControllerWithDeatilID:[dictionary[@"detailID"] integerValue]];
        return YES;
    } else if ([actionTag isEqualToString:@"showToast"]) {
        [self.view makeToast:dictionary[@"message"] duration:1.0f position:CSToastPositionCenter];
        return YES;
    } else if ([actionTag isEqualToString:@"pay"]) {
        [self nativePushPayViewControllerWithOrderID:[dictionary[@"orderID"] integerValue] Callback:callbackBlock];
        return YES;
    }

    return NO;
}

- (void)nativeLogin {
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:loginVC];
    [self presentViewController:navigation animated:YES completion:nil];}

- (void)nativeAppHome:(NSInteger)tabIndex {
    UITabBarController *tabBarC = self.navigationController.tabBarController;
    if (tabIndex < 0 || tabIndex >= tabBarC.viewControllers.count) {
        return;
    }
    if (tabBarC.selectedIndex == tabIndex) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        self.navigationController.tabBarController.selectedIndex = tabIndex;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

- (void)nativePushSubViewControllerWithDeatilID:(NSInteger)deatilID {
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)nativePushPayViewControllerWithOrderID:(NSInteger)orderID Callback:(HybridCallbackBlock)callbackBlock{
    LDPayViewController * payVC = [[LDPayViewController alloc]init];
    payVC.orderId = orderID;
    payVC.resultBlock = ^(BOOL isPaySucc){
        if (isPaySucc){
            callbackBlock(YES,@{ @"code": @(10000), @"message" : @"支付成功"});
        }else{
            callbackBlock(YES,@{ @"code": @(10001), @"message" : @"支付失败" });
        }
    };
    [self.navigationController pushViewController:payVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
