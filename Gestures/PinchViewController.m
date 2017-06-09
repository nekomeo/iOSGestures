//
//  PinchViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "PinchViewController.h"
#import "constraintApplier.h"
#import <UIKit/UIKit.h>

@interface PinchViewController ()

@end

@implementation PinchViewController

-(void)viewDidLoad {
    constraintApplier *constApplier = [[constraintApplier alloc] init];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.pinkView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [constApplier pinFourCornersOfView:self.pinkView toSuperView:self.view];
    
}

@end
