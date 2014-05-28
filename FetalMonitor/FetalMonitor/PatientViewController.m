//
//  PatientViewController.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "PatientViewController.h"

@interface PatientViewController (){
    CALayer *layer;
    CABasicAnimation *layerAnimation;
}

@end

@implementation PatientViewController
@synthesize fullName = _fullName;
@synthesize monitorView = _monitorView;
@synthesize fullNameStr = _fullNameStr;
@synthesize imageView = _imageView;
@synthesize imageName = _imageName;

#pragma mark - animation methodes

-(void)scroll {
    UIImage *image = [UIImage imageNamed:_imageName];
    UIColor *pattern = [UIColor colorWithPatternImage:image];
    layer = [CALayer layer];
    layer.backgroundColor = pattern.CGColor;
    layer.transform = CATransform3DMakeScale(1, -1, 1);
    layer.anchorPoint = CGPointMake(0, 1);
    CGSize viewSize = _imageView.bounds.size;
    layer.frame = CGRectMake(0, 0, image.size.width + viewSize.width, viewSize.height);
    [_imageView.layer addSublayer:layer];
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(-image.size.width, 0);
    layerAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    layerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    layerAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    layerAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    layerAnimation.repeatCount = HUGE_VALF;
    layerAnimation.duration = 5.0;
    [self applyLayerAnimation];
}

-(void)oppositeScroll {
    UIImage *image = [UIImage imageNamed:_imageName];
    UIColor *pattern = [UIColor colorWithPatternImage:image];
    layer = [CALayer layer];
    layer.backgroundColor = pattern.CGColor;
    layer.transform = CATransform3DMakeScale(1, -1, 1);
    layer.anchorPoint = CGPointMake(0, 1);
    CGSize viewSize = _imageView.bounds.size;
    layer.frame = CGRectMake(0, 0, image.size.width + viewSize.width, viewSize.height);
    [_imageView.layer addSublayer:layer];
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(-image.size.width, 0);
    layerAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    layerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    layerAnimation.fromValue = [NSValue valueWithCGPoint:endPoint];
    layerAnimation.toValue = [NSValue valueWithCGPoint:startPoint];
    layerAnimation.repeatCount = HUGE_VALF;
    layerAnimation.duration = 5.0;
    [self applyLayerAnimation];
}


- (void)applyLayerAnimation {
    [layer addAnimation:layerAnimation forKey:@"position"];
}

#pragma mark - life cycle methodes

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
    _fullName.text = _fullNameStr;
    [self scroll];
    
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _fullName.text = _fullNameStr;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void)applicationWillEnterForeground:(NSNotification *)note {
    [self applyLayerAnimation];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)rewind:(id)sender
{
    [_imageView.layer removeAllAnimations];
    [self oppositeScroll];
    
}

-(IBAction)run:(id)sender
{
    [_imageView.layer removeAllAnimations];
    [self scroll];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
