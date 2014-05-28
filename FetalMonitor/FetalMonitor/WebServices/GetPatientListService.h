//
//  GetPatientListService.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StubbedServer.h"
#import "InstanceManager.h"
#import "Patient.h"

@protocol GetPatientListServiceDelegate <NSObject>

@required
-(void)succeedWithPatientList:(NSArray *)patients;
-(void)failedWithError:(NSString *)errorMsg;

@end

@interface GetPatientListService : NSObject<ServerDelegate>

@property (nonatomic,weak) id<GetPatientListServiceDelegate> delegate;

-(void)getAllPatients;

@end
