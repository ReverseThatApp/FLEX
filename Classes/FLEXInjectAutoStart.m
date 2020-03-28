//
//  FLEXInjectAutoStart.m
//  FLEX
//
//  Created by Henry on 28/3/20.
//  Copyright © 2020 Flipboard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager/FLEXManager.h"
#import <Security/SecureTransport.h>

@interface FLEXInjectAutoStart: NSObject
@end

@implementation FLEXInjectAutoStart

static void __attribute__((constructor)) initialize(void){
    NSLog(@"==== FLEX Injected in Action====");
    // delay 2 seconds after this lib loaded then show explorer
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"SHOWING FLEX Explorer....");
        [[FLEXManager sharedManager] showExplorer];
        NSLog(@"SHOWN FLEX Explorer!!!");
    });
}

@end
