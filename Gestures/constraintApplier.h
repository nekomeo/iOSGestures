//
//  constraintApplier.h
//  Gestures
//
//  Created by Elle Ti on 2017-06-08.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface constraintApplier : NSObject

-(void)pinFourCornersOfView:(UIView *)view toSuperView:(UIView *)superView;

@end
