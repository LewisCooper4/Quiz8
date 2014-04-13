//
//  EtchView.m
//  EtchASketch
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "EtchView.h"

@implementation EtchView

@synthesize points;
@synthesize currentPoint;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor] setStroke];
    
    [bz moveToPoint:[[points objectAtIndex:0] CGPointValue]];
    for (id p in points) {
        [bz addLineToPoint:[p CGPointValue]];
    }
    
    CGPoint lastPoint = [[points lastObject] CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.currentHorizontalAngle*10.0, lastPoint.y + self.currentVerticalAngle*10.0);
    
    // make sure the dot stays in the screen
    if (currentPoint.x < 0) {
        currentPoint.x = 0;
    }
    else if (currentPoint.x > self.bounds.size.width) {
        currentPoint.x = self.bounds.size.width;
    }
    if (currentPoint.y < 0) {
        currentPoint.y = 0;
    }
    if (currentPoint.y > self.bounds.size.height) {
        currentPoint.y = self.bounds.size.height;
    }
    
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    
    [self drawCurrentPoint];
}

- (void) saveCurrentPoint
{
    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
}

- (void) drawCurrentPoint
{
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x-2, currentPoint.y-2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
}
                            

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        [points removeAllObjects];
        [points addObject:[NSValue valueWithCGPoint:currentPoint]];
        [self setNeedsDisplay];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}


@end
