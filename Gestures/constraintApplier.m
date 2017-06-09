//
//  constraintApplier.m
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "constraintApplier.h"


@implementation constraintApplier

-(void)pinFourCornersOfView:(UIView *)view toSuperView:(UIView *)superView {
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeLeading
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:superView
                                                           attribute:NSLayoutAttributeLeading
                                                          multiplier:1.0
                                                            constant:0];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:superView
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0];
    
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:superView
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier:1.0
                                                            constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:superView
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:1.0
                                                            constant:0];
    [superView addConstraints:@[leading, top, trailing, bottom]];
}

@end
