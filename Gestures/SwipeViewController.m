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
@property (nonatomic) BOOL open;

@end

@implementation SwipeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Brown Box
    CGFloat width = 400;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.brownBox = [[UIView alloc] initWithFrame:frame];
    self.brownBox.backgroundColor = [UIColor brownColor];

    [self.view addSubview:self.brownBox];
    [self.brownBox setClipsToBounds:YES];
    
    // White Box
    self.whiteBox = [[UIView alloc] initWithFrame:self.brownBox.bounds];
    self.whiteBox.backgroundColor = [UIColor whiteColor];
    [self.brownBox addSubview:self.whiteBox];
    
    UISwipeGestureRecognizer *swipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.whiteBox addGestureRecognizer:swipeLeftGesture];
    
    UISwipeGestureRecognizer *swipeRightGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.whiteBox addGestureRecognizer:swipeRightGesture];
    
}

- (void)didSwipe:(UISwipeGestureRecognizer *)sender
{
    switch (sender.direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
        {
            sender.view.center = CGPointMake(CGRectGetMidX(self.brownBox.bounds) - 100, sender.view.center.y);
//            NSLog(@"Swipe left detected");
        }
            break;
        case UISwipeGestureRecognizerDirectionRight:
        {
            sender.view.center = CGPointMake(CGRectGetMidX(self.brownBox.bounds), sender.view.center.y);
//            NSLog(@"Swipe right detected");
        }
            break;
        default:
            break;
    }
}


@end
