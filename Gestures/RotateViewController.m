//
//  RotateViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *rotateView = [[UIView alloc] initWithFrame:frame];
    rotateView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotateView];
    
    UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(viewRotate:)];
    [rotateView addGestureRecognizer:rotateGesture];
    }

- (void)viewRotate:(UIRotationGestureRecognizer *)sender
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(sender.rotation);
    sender.view.transform = transform;
//    NSLog(@"Rotating %@", NSStringFromCGAffineTransform(sender.view.transform));
}

@end
