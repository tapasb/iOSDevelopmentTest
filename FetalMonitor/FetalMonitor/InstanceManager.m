//
//  InstanceManager.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "InstanceManager.h"

@implementation InstanceManager

+ (StubbedServer *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      sharedInstance = [[StubbedServer alloc] init];
                  });
    
    return sharedInstance;
}

@end
