
#ifndef HybridUrlHanlder1_h
#define HybridUrlHanlder1_h
#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>

static NSString *const kHybridScheme = @"gm";
static NSString *const kHybridPortalVar = @"gm";
static NSString *const kHybridParamKey = @"param";
static NSString *const kHybridCallbackKey = @"callback";

typedef void (^HybridCallbackBlock)(BOOL isSucc, NSDictionary *nativeResponseData);

@protocol HybridUrlHanlder <NSObject>

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

@end

#endif /* HybridUrlHanlder_h */