//
//  WindAbstractLogger.h
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WindLogLevel) {
    WindLogLevelAll = 0,
    WindLogLevelDebug,
    WindLogLevelNormal,
    WindLogLevelWarning,
    WindLogLevelError,
    WindLogLevelTrace
};

@interface WindAbstractLogger : NSObject

@property (nonatomic, assign) WindLogLevel level;

@property (nonatomic, copy) NSString *filePath;

@property (nonatomic,strong) WindAbstractLogger *nextLogger;

- (instancetype)initWithLevel:(WindLogLevel)level;

- (instancetype)initWithLevel:(WindLogLevel)level withFilePath:(NSString *)filePath;

- (void)logMessage:(NSString *)message Level:(WindLogLevel)level;

- (void)write:(NSString *)message;

@end

NS_ASSUME_NONNULL_END
