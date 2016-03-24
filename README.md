# WebViewJavascriptBridgeDemoToApp

首先感谢<a href = "https://github.com/marcuswestin/WebViewJavascriptBridge">WebViewJavascriptBridge</a>的作者，大家可以去看下源码，顺手给个Star。

最近项目中要求 `HTML` , `native` 互相调用，本来对这个不是很懂，以前做这方面需求的时候是通过：

```
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
}
```
拦截reuqest,判断关键字来完成需求。这种方法太low了而且并不灵活，就去网上查了一些资料，自己研究了一下写的一个小Demo，希望可以帮到需要的人。


##使用介绍：
`actionNames` App支持的方法名称 此处需要与前端协商 定好每个方法的名称 

```
/**
 *  处理URL
 *
 *  @param theURL
 *
 *  @return 是否成功处理
 */
- (BOOL)handleDictionAry:(NSDictionary *)dictionary callback:(HybridCallbackBlock)callbackBlock;

/**
 *  可以接受的actionNames列表
 *
 * 每个Item为NSString类型
 */
- (NSArray *)actionNames;

```
注册方法  接受回调 

```
- (BOOL)registerHybridUrlHanlder:(id<HybridUrlHanlder>)handler andBridge:(WebViewJavascriptBridge *)bridge {
    NSAssert([handler actionNames], @"action can not be nil");
    if (![handler actionNames]) {
        return NO;
    }
    for (NSString *action in [handler actionNames]) {
        [self.handlersDict setObject:handler forKey:action];

        [bridge registerHandler : action handler :^ (id data, WVJBResponseCallback responseCallback) {
            
            id<HybridUrlHanlder> handler = [self.handlersDict objectForKey:[NSString stringWithFormat:@"%@",data[@"actionName"]]];

            if (handler) {
                [handler handleDictionAry:data callback:^(BOOL isSucc, NSDictionary *nativeResponseData) {
                    if (isSucc) {
                        responseCallback(@{@"data":nativeResponseData}); //需要返回给HTML 部分参数 例子：pay 支付结果
                        return ;
                    }
                }];
            }
        }];
    }

    return YES;
}
```

<a href = "https://github.com/yaoquanfeng123/WebViewJavascriptBridgeDemoToApp">Demo地址</a>

推荐文章：

<a href = "https://segmentfault.com/a/1190000004263182">Hybrid APP架构设计思路</a>

<a href = "http://web.jobbole.com/84121/">浅谈Hybrid技术的设计与实现</a>



