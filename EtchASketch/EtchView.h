//
//  EtchView.h
//  EtchASketch
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EtchView : UIView
{
    
}

@property (nonatomic) UIBezierPath *points;

@property CGPoint currentPoint;

@property CGFloat currentHorizontalAngle;
@property CGFloat currentVerticalAngle;
@property CGFloat currentVelocity;

@end
