//
//  WindErrorLogger.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/8.
//

#import "WindErrorLogger.h"

@implementation WindErrorLogger

- (void)write:(NSString *)message {
    [super write:message];
    NSLog(@"[Error Logger] %@\n",message);
    NSString *formmaterLogLevel = [NSString stringWithFormat:@"[E]:%@\n",message];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:self.filePath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[formmaterLogLevel dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
}

@end
