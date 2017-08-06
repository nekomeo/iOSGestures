//
//  EdgeViewController.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@property (nonatomic) UIView *edgeView;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *edgePanGesture;
@property (nonatomic) UIPanGestureRecognizer *panGesture;

@property (nonatomic) CGFloat edgeViewOldMidX;
@property (nonatomic) CGFloat edgeViewNewMidX;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = 400;
    CGFloat height = 400;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) + width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    self.edgeView = [[UIView alloc] initWithFrame:frame];
    self.edgeView.backgroundColor = [UIColor greenColor];
    self.edgeViewOldMidX = self.edgeView.center.x;
    [self.view addSubview:self.edgeView];
    
    self.edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewEdgePan:)];
    self.edgePanGesture.edges = UIRectEdgeRight;
    [self.edgeView addGestureRecognizer:self.edgePanGesture];
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.edgeView addGestureRecognizer:self.panGesture];
    self.panGesture.enabled = NO;
}

- (void)viewEdgePan:(UIScreenEdgePanGestureRecognizer *)sender
{
//    CGPoint location = [sender locationInView:self.view]; // Location of where you pressed
    CGPoint translation = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y);
    [sender setTranslation:CGPointZero inView:sender.view];
    
    switch (sender.state)
    {
        case UIGestureRecognizerStateEnded:
            if (sender.view.center.x >= self.edgeViewOldMidX - 100.0)
            {
                [UIView animateWithDuration:0.5 animations:^{
                    sender.view.center = CGPointMake(self.edgeViewOldMidX, sender.view.center.y);
                }];
                break;
            }
            else
            {
                [UIView animateWithDuration:0.5 animations:^{
                    sender.view.center = CGPointMake(self.view.center.x + 50, sender.view.center.y);
                }];
                self.edgeViewNewMidX = sender.view.center.x;
                [sender.view removeGestureRecognizer:sender];
                
                self.edgePanGesture.enabled = NO;
                self.panGesture.enabled = YES;

                break;
            }
        default:
            break;
    }

}

- (void)panned:(UIPanGestureRecognizer *)sender
{
    CGPoint translation = [sender translationInView:sender.view];
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y);
    [sender setTranslation:CGPointZero inView:sender.view];
    
    switch (sender.state)
    {
        case UIGestureRecognizerStateEnded:
            if (sender.view.center.x < self.edgeViewNewMidX + 100)
            {
                [UIView animateWithDuration:0.5 animations:^{
                    sender.view.center = CGPointMake(self.edgeViewNewMidX, sender.view.center.y);
                }];
                break;
            }
            else
            {
                [UIView animateWithDuration:0.5 animations:^{
                    sender.view.center = CGPointMake(self.edgeViewOldMidX, sender.view.center.y);
                }];
                [sender.view removeGestureRecognizer:sender];
                
                self.panGesture.enabled = NO;
                self.edgePanGesture.enabled = YES;
                
                break;
            }
            
        default:
            break;
    }
}

@end
