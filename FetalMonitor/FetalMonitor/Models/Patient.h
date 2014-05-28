//
//  Patient.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property(nonatomic,strong) NSString *firstName;
@property(nonatomic,strong) NSString *lastName;
@property int age;

-(instancetype) initWithDictionary:(NSDictionary *)dict;


@end
