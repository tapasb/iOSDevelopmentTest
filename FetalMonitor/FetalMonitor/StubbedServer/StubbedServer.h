//
//  StubbedServer.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

@protocol ServerDelegate <NSObject>

@required
-(void)succeedWithJson:(NSString *)json;
-(void)failedWithError:(NSString *)errorMsg;

@end

#import <Foundation/Foundation.h>

@interface StubbedServer : NSObject

-(void)executeService:(int)serviceCode withDelegate:(id)delegate;

@end
