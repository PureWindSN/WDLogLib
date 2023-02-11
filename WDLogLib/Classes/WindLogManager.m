//
//  WindLogManager.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/10.
//

#import "WindLogManager.h"
#import <UIKit/UIKit.h>
#import "WindErrorLogger.h"
#import "WindDebugLogger.h"
#import "WindNormalLogger.h"
#import "WindTraceLogger.h"
#import "WindWarningLogger.h"

#define kLogFilePath [NSHomeDirectory() stringByAppendingString:\
[NSString stringWithFormat:@"/Documents/%@",@"com.wind.xx.log"]]\

@implementation WindLogManager

+ (instancetype)sharedInstance {
    static WindLogManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self createFile];
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

- (WindAbstractLogger *)firstLogger {
    WindErrorLogger *errorLogger = [[WindErrorLogger alloc] initWithLevel:WindLogLevelError
                                                             withFilePath:kLogFilePath];
    WindDebugLogger *debugLogger = [[WindDebugLogger alloc] initWithLevel:WindLogLevelDebug
                                                             withFilePath:kLogFilePath];
    WindNormalLogger *normalLogger = [[WindNormalLogger alloc] initWithLevel:WindLogLevelNormal
                                                                withFilePath:kLogFilePath];
    WindTraceLogger *traceLogger = [[WindTraceLogger alloc] initWithLevel:WindLogLevelTrace
                                                             withFilePath:kLogFilePath];
    WindWarningLogger *warningLogger = [[WindWarningLogger alloc] initWithLevel:WindLogLevelWarning
                                                                 withFilePath:kLogFilePath];
    [errorLogger setNextLogger:debugLogger];
    [debugLogger setNextLogger:normalLogger];
    [normalLogger setNextLogger:traceLogger];
    [traceLogger setNextLogger:warningLogger];
    return  errorLogger;
}

#pragma mark - related file operations
- (void)createFile {
    if (![[NSFileManager defaultManager] fileExistsAtPath:kLogFilePath]) {
        [[NSFileManager defaultManager] createFileAtPath:kLogFilePath
                                                contents:nil
                                              attributes:nil];
    }
}

- (void)deleteFile {
    
}

- (void)showShareWindow {
    NSURL *logFileURL = [NSURL fileURLWithPath:kLogFilePath];
    NSArray *activityItems = [NSArray arrayWithObject:logFileURL];
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToTwitter,
                                                     UIActivityTypeMessage,
                                                     UIActivityTypePrint,
                                                     UIActivityTypeCopyToPasteboard,
                                                     UIActivityTypeAssignToContact,
                                                     UIActivityTypeAddToReadingList,
                                                     UIActivityTypePostToFlickr,
                                                     UIActivityTypePostToTencentWeibo,
                                                     UIActivityTypeOpenInIBooks,
                                                     UIActivityTypeSaveToCameraRoll
    ];
    activityViewController.completionWithItemsHandler =
    ^(UIActivityType __nullable activityType,
      BOOL completed,
      NSArray * __nullable returnedItems,
      NSError * __nullable activityError) {
        if (completed) {
            WindLogD(@"did share log");
        } else {
            WindLogD(@"cancel sharing");
        }
    };
    
    [[UIApplication sharedApplication].keyWindow.rootViewController
     presentViewController:activityViewController
                  animated:YES
                completion:nil];
}

@end
