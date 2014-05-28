//
//  PatientListViewController.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "PatientListViewController.h"

@interface PatientListViewController (){
    NSArray* patientList;
}

@end

@implementation PatientListViewController
@synthesize pVC = _pVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    dispatch_async(queue, ^{
        GetPatientListService *service = [[GetPatientListService alloc] init];
        service.delegate = self;
        [service getAllPatients];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma - mark TableView delegate methodes

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PatientCell *cell = (PatientCell *)[tableView dequeueReusableCellWithIdentifier:@"PatientCell"];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PatientCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    Patient *patient = (Patient *)[patientList objectAtIndex:indexPath.row];
    cell.firstName.text = patient.firstName;
    cell.lastName.text = patient.lastName;
    cell.age.text = [NSString stringWithFormat:@"%d",patient.age ];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [patientList count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GetMonitorDataService *service = [[GetMonitorDataService alloc] init];
    service.delegate = self;
    if(_pVC == nil){
        _pVC = (PatientViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"PatientViewController"];
    }
    Patient *patient = (Patient *)[patientList objectAtIndex:indexPath.row];
    NSString* fullName = [NSString stringWithFormat:@"%@ %@", patient.firstName, patient.lastName];
    _pVC.fullNameStr = fullName;
    [service getMonitorData];
}



#pragma - mark Navigation methodes
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma - mark Service Delegate Methodes

-(void)succeedWithPatientList:(NSArray *)patients{
    patientList = patients;
}
-(void)failedWithError:(NSString *)errorMsg{
    
}

-(void)succeedWithMonitorData:(NSString *)imageName{
    _pVC.imageName = imageName;
    [self.navigationController pushViewController:_pVC animated:YES];
}
-(void)failedGettingMonitorDataWithError:(NSString *)errorMsg{
    
}

#pragma mark - Rotation methods

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}



@end
