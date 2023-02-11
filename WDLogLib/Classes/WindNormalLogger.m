//
//  WindNormalLogger.m
//  pd_mob_sdK_ios
//
//  Created by Wind on 2023/2/8.
//

#import "WindNormalLogger.h"

@implementation WindNormalLogger

- (void)write:(NSString *)message {
    NSLog(@"Normal Logger %@",message);
    NSString *formmaterLogLevel = [NSString stringWithFormat:@"[N]:%@\n",message];
    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:self.filePath];
    [fileHandler seekToEndOfFile];
    [fileHandler writeData:[formmaterLogLevel dataUsingEncoding:NSUTF8StringEncoding]];
    [fileHandler closeFile];
}

@end
