//
//  PatientListViewController.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetPatientListService.h"
#import "PatientCell.h"
#import "GetMonitorDataService.h"
#import "PatientViewController.h"

@interface PatientListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,GetPatientListServiceDelegate,GetMonitorDataServiceDelegate>

@property(nonatomic,strong) PatientViewController * pVC;

@end
