//
//  WindAbstractLogger.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/8.
//

#import "WindAbstractLogger.h"

@implementation WindAbstractLogger

- (instancetype)initWithLevel:(WindLogLevel)level {
    if (self = [super init]) {
        self.level = level;
    }
    return self;
}

- (instancetype)initWithLevel:(WindLogLevel)level withFilePath:(NSString *)filePath {
    if (self = [super init]) {
        self.level = level;
        self.filePath = filePath;
    }
    return self;
}

- (void)logMessage:(NSString *)message Level:(WindLogLevel)level{
    NSString *log = [NSString stringWithFormat:@"%@ %s %d %@",[self logTime],__func__,__LINE__,message];
    if (level == self.level) {
        [self write:log];
    }
    if (self.nextLogger) {
        [self.nextLogger logMessage:message Level:level];
    }
}

- (void)write:(NSString *)message{
    [self recordLogHeader];
}

#pragma mark - private methods
- (NSString *)logTime {
    
    NSDate *date = [NSDate date];
    NSInteger interval = [[NSTimeZone systemTimeZone] secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [dateFormatter stringFromDate:localeDate];
}

/**
 * Custom log header. Eg: Date、launchTime、version、bundleId、appName adn etc.
 */
- (void)recordLogHeader {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //NSLog(@"record log header...");
        // Record some log header
        //NSString *formmaterLogLevel = [NSString stringWithFormat:@"\n      Date: %@      \n :%@\n",[NSDate date],@"record log header..."];
        NSString *formmaterLogLevel = [NSString stringWithFormat:@"\n      You can add custom log header info here      \n"];
        NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:self.filePath];
        [fileHandler seekToEndOfFile];
        [fileHandler writeData:[formmaterLogLevel dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandler closeFile];
    });
}

@end
