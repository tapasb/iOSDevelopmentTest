//
//  PatientCell.h
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *firstName;
@property(nonatomic,strong) IBOutlet UILabel *lastName;
@property(nonatomic,strong) IBOutlet UILabel *age;

@end
