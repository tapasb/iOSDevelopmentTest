//
//  PatientViewController.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "ViewController.h"

@interface PatientViewController : ViewController

@property(nonatomic,strong) NSString* fullNameStr;
@property(nonatomic,strong) NSString* imageName;
@property(nonatomic,strong) IBOutlet UILabel* fullName;
@property(nonatomic,strong) IBOutlet UIView* monitorView;
@property(nonatomic,strong) IBOutlet UIImageView* imageView;

@end
