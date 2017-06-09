//
//  TapViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

-(void)viewDidLoad {
    constraintApplier *constApplier = [[constraintApplier alloc] init];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [constApplier pinFourCornersOfView:self.yellowView toSuperView:self.view];
    
}

@end
