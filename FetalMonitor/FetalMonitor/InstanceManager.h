//
//  InstanceManager.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StubbedServer.h"

@interface InstanceManager : NSObject

+ (StubbedServer *)sharedInstance;

@end
