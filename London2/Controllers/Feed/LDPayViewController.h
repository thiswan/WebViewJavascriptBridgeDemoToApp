//
//  LDPayViewController.h
//  London2
//
//  Created by Mr.Yao on 16/3/24.
//  Copyright © 2016年 yaoquafeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PayOrderResultBlock)(BOOL isPaySucc);

@interface LDPayViewController : UIViewController

@property (nonatomic,assign) NSInteger orderId;

@property (strong, nonatomic) PayOrderResultBlock resultBlock;

@end
