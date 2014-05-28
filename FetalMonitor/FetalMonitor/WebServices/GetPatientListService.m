//
//  GetPatientListService.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "GetPatientListService.h"

#define serviceCode 1

@implementation GetPatientListService

-(void)getAllPatients
{
    StubbedServer *server = [InstanceManager sharedInstance];
    [server executeService:serviceCode withDelegate:self];
}

-(void)succeedWithJson:(NSString *)json
{
    NSArray *patients = [GetPatientListService patientList:json];
    [self.delegate succeedWithPatientList:patients];
}

-(void)failedWithError:(NSString *)errorMsg
{
    
}

+(NSArray *)patientList:(NSString *)json{
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
    if(error){
        return nil;
    }
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    for(NSDictionary* dict in jsonResponse){
        [retArray addObject:[[Patient alloc] initWithDictionary:dict]];
    }
    
    return retArray;
}

@end
