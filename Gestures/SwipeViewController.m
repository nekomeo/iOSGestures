//
//  SwipeViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()
@property (nonatomic) UIView *brownBox;
@property (nonatomic) UIView *whiteBox;

@end

@implementation SwipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 400;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectZero];
    whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.brownBox addSubview:whiteView];
    self.whiteBox = whiteView;
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewSwiped:)];
    [view addGestureRecognizer:swipeGesture];
}

- (void)viewSwiped:(UISwipeGestureRecognizer *)sender
{
    
}


@end
