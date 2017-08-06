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
@property (nonatomic) UIPanGestureRecognizer *swipeRightGesture;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.width = 400;
    self.height = 400;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) + self.width/2.25, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
    
    self.edgeView = [[UIView alloc] initWithFrame:frame];
    self.edgeView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.edgeView];
    
    self.edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(viewEdgePan:)];
    self.edgePanGesture.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:self.edgePanGesture];
    
    self.swipeRightGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.view addGestureRecognizer:self.swipeRightGesture];
    self.swipeRightGesture.enabled = NO;
}

- (void)viewEdgePan:(UIScreenEdgePanGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view]; // Location of where you pressed
    CGPoint translation = [sender translationInView:self.view];
    
    switch (sender.state)
    {
//        case UIGestureRecognizerStateBegan:
//            self.edgeViewGestureStartCenter = self.view.center;
        case UIGestureRecognizerStateChanged:
//            self.edgeView.center = center + xTranslation
            if (location.x >= self.view.frame.size.width-100.0)
            {
                self.edgeView.center = CGPointMake(self.edgeView.center.x + translation.x, self.edgeView.center.y);
                [sender setTranslation:CGPointMake(0, 0) inView:sender.view.superview];
                self.edgePanGesture.enabled = NO;
                self.swipeRightGesture.enabled = YES;
            }
            else if (translation.x > 0)
            {
                self.edgeView.center = CGPointMake(self.edgeView.center.x + translation.x, self.edgeView.center.y);
                [sender setTranslation:CGPointMake(0, 0) inView:sender.view.superview];
            }
            break;
        case UIGestureRecognizerStateEnded:
            if (location.x > 290)
            {
                [UIView animateWithDuration:0.5 animations:^{
                    
                    self.width = 400;
                    self.height = 400;
                    
                    self.edgeView.frame = CGRectMake(CGRectGetMidX(self.view.bounds) + self.width/2.25, CGRectGetMidY(self.view.bounds) - self.height/2, self.width, self.height);
                }];
            }
            else
            {
                [UIView animateWithDuration:0.5 animations:^{
                    self.edgeView.frame = CGRectMake(self.view.frame.size.width*0.5, self.edgeView.frame.origin.y, self.edgeView.frame.size.width, self.edgeView.frame.size.height);
                }];
            }
            break;
            
        default:
            break;
    }

}

- (void)panned:(UIPanGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat width = 400;
        CGFloat height = 400;
        
        self.edgeView.frame = CGRectMake(CGRectGetMidX(self.view.frame) + width/2, CGRectGetMidY(self.view.frame) - height/2, width, height);
        }];
    self.swipeRightGesture.enabled = NO;
    self.edgePanGesture.enabled = YES;
}

@end
