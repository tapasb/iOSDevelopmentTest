//
//  GetMonitorDataService.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StubbedServer.h"
#import "InstanceManager.h"
#import "Patient.h"

@protocol GetMonitorDataServiceDelegate <NSObject>

@required
-(void)succeedWithMonitorData:(NSString *)imageName;
-(void)failedGettingMonitorDataWithError:(NSString *)errorMsg;

@end

@interface GetMonitorDataService : NSObject<ServerDelegate>

@property (nonatomic,weak) id<GetMonitorDataServiceDelegate> delegate;

-(void)getMonitorData;

@end