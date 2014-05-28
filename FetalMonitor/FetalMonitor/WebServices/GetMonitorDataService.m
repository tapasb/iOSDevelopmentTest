//
//  GetMonitorDataService.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "GetMonitorDataService.h"

#define serviceCode 2

@implementation GetMonitorDataService

-(void)getMonitorData
{
    StubbedServer *server = [InstanceManager sharedInstance];
    [server executeService:serviceCode withDelegate:self];
}

-(void)succeedWithJson:(NSString *)json
{
    NSString *imageName = [GetMonitorDataService imageFileName:json];
    [self.delegate succeedWithMonitorData:imageName];
}

-(void)failedWithError:(NSString *)errorMsg
{
    
}

+(NSString *)imageFileName:(NSString *)json{
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
    if(error){
        return nil;
    }
    NSString *retString = nil;
    for(NSDictionary* dict in jsonResponse){
        retString = [dict objectForKey:@"monitor_data"];
    }
    
    return retString;
}


@end
