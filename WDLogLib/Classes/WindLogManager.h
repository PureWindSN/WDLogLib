//
//  WindLogManager.h
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/10.
//

#import <Foundation/Foundation.h>
#import "WindAbstractLogger.h"

NS_ASSUME_NONNULL_BEGIN
#define kWindLogInstance [WindLogManager sharedInstance]
//#define WindLogD(msg) [kWindLogInstance.firstLogger logMessage:msg Level:WindLogLevelDebug]
//#define WindLogE(msg) [kWindLogInstance.firstLogger logMessage:msg Level:WindLogLevelError]
//#define WindLogT(msg) [kWindLogInstance.firstLogger logMessage:msg Level:WindLogLevelTrace]

#define WindLogD(format,...) [kWindLogInstance.firstLogger logMessage:[NSString stringWithFormat:format, ##__VA_ARGS__] Level:WindLogLevelDebug]
#define WindLogE(format,...) [kWindLogInstance.firstLogger logMessage:[NSString stringWithFormat:format, ##__VA_ARGS__] Level:WindLogLevelError]
#define WindLogT(format,...) [kWindLogInstance.firstLogger logMessage:[NSString stringWithFormat:format, ##__VA_ARGS__] Level:WindLogLevelTrace]


@interface WindLogManager : NSObject

@property (nonatomic, strong) WindAbstractLogger *firstLogger;

+ (instancetype)sharedInstance;

- (void)showShareWindow;

@end

NS_ASSUME_NONNULL_END
