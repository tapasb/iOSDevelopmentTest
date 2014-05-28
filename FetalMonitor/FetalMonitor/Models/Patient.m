//
//  Patient.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "Patient.h"

@implementation Patient

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize age = _age;


-(instancetype) initWithDictionary:(NSDictionary *)patientDict{
    self = [super init];
    if(self){
        _firstName = [patientDict objectForKey:@"first_name"];
        _lastName = [patientDict objectForKey:@"last_name"];
        _age = [[patientDict objectForKey:@"age"] intValue];
    }
    return self;
}

@end
