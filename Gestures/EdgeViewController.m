//
//  EdgeViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 300;
    CGFloat height = 300;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
}

@end
