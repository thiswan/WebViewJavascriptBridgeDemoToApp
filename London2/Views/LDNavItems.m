//
//  LDNavItems.m
//  London2
//
//  Created by yaoquafeng on 15/9/24.
//  Copyright © 2015年 yaoquafeng. All rights reserved.
//

#import "LDNavItems.h"

@implementation LDNavItems

+ (UIView *)titleViewWithText:(NSString *)text {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 200, 44.0f)];
    titleLabel.text = text;
    titleLabel.textColor = [UIColor colorWithRed:254/255.0 green:202/255.0 blue:11/255.0 alpha:1];
    titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    return titleLabel;
}

@end
