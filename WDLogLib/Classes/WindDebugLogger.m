//
//  WindDebugLogger.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/8.
//

#import "WindDebugLogger.h"

@implementation WindDebugLogger

- (void)write:(NSString *)message {
    [super write:message];
    NSLog(@"[Debug Logger] %@\n",message);
    
    NSString *formmaterLogLevel = [NSString stringWithFormat:@"[Debug Logger] :%@\n",message];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:self.filePath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[formmaterLogLevel dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
}

@end
