//
//  TapViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()
@property (nonatomic) BOOL changeColor;
@property (nonatomic) UIView *box;

@end

@implementation TapViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    self.box = view;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(whenTapped:)];
    [view addGestureRecognizer:tapGesture];
}

- (void)whenTapped:(UITapGestureRecognizer *)sender
{
    NSLog(@"Current color %@", self.box.backgroundColor);
    self.box.backgroundColor = [self.box.backgroundColor isEqual:[UIColor orangeColor]] ? [UIColor purpleColor] : [UIColor orangeColor];
}

@end
