#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "WindAbstractLogger.h"
#import "WindDebugLogger.h"
#import "WindErrorLogger.h"
#import "WindLogManager.h"
#import "WindNormalLogger.h"
#import "WindTraceLogger.h"
#import "WindWarningLogger.h"

FOUNDATION_EXPORT double WDLogLibVersionNumber;
FOUNDATION_EXPORT const unsigned char WDLogLibVersionString[];

