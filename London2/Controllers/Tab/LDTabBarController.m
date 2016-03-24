//
//  LDTabBarController.m
//  London2
//
//  Created by yaoquafeng on 15/9/24.
//  Copyright © 2015年 yaoquafeng. All rights reserved.
//

#import "LDTabBarController.h"
#import "LDActivityViewController.h"
#import "LDFeedViewController.h"
#import "LDForumViewController.h"
#import "LDPorfileViewController.h"
#import "LDPublishViewController.h"
#import "UIImage+ColorImage.h"

@interface LDTabBarController ()<UITabBarControllerDelegate>

@property (strong, nonatomic) LDPorfileViewController *mineVC;

@end

@implementation LDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 定制外观
    self.tabBar.tintColor = [UIColor colorWithRed:254/255.0 green:202/255.0 blue:11/255.0 alpha:1];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc]init]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    
    // 首页
    LDFeedViewController *feedVC = [[LDFeedViewController alloc] init];
    feedVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    feedVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_hl"];
    feedVC.tabBarItem.title = @"one";
    UINavigationController *feedNavC = [[UINavigationController alloc] initWithRootViewController:feedVC];
    

    // 一起玩
    LDActivityViewController *activityVC = [[LDActivityViewController alloc] init];
    activityVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_activity"];
    activityVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_activity_hl"];
    activityVC.tabBarItem.title = @"two";
    UINavigationController *activityNavC = [[UINavigationController alloc] initWithRootViewController:activityVC];
    
    // 拍摄
    LDPublishViewController *publishVC = [[LDPublishViewController alloc] init];
    publishVC.tabBarItem.image = [UIImage imageNamed:@"tabBar_plus"];
    publishVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_plus"];
    UINavigationController *publishNavC = [[UINavigationController alloc] initWithRootViewController:publishVC];
    
    //俱乐部
    LDForumViewController *forumVC = [[LDForumViewController alloc] init];
    forumVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_club"];
    forumVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_club_hl"];
    forumVC.tabBarItem.title = @"four";
    UINavigationController *forumNavC = [[UINavigationController alloc] initWithRootViewController:forumVC];
    
    // 我的
    self.mineVC = [[LDPorfileViewController alloc] init];
    self.mineVC.tabBarItem.image = [UIImage imageNamed:@"tabar_profile"];
    self.mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_hl"];
    self.mineVC.tabBarItem.title = @"five";
    UINavigationController *mineNavC = [[UINavigationController alloc] initWithRootViewController:self.mineVC];
    self.viewControllers = @[feedNavC,activityNavC,publishNavC,forumNavC,mineNavC];
}

    



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
