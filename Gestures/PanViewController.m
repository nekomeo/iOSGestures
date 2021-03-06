//
//  PanViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation PanViewController

- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender
{
//    CGPoint locationInView = [sender locationInView:self.view];
//    sender.view.center = locationInView;
    CGPoint translationInView = [sender translationInView:self.view]; // Add to center of red square
    
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
}


@end
