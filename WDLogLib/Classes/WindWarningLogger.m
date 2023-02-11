//
//  WindWarningLogger.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/11.
//

#import "WindWarningLogger.h"

@implementation WindWarningLogger

- (void)write:(NSString *)message {
    NSString *formmaterLogLevel = [NSString stringWithFormat:@"[W]:%@\n",message];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:self.filePath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[formmaterLogLevel dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
}

@end
