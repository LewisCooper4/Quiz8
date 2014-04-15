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
        
        
        points = [[UIBezierPath alloc]init];
        [points moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
        currentPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        points = [[UIBezierPath alloc]init];
        [points moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
        currentPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        //set background
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UIRectFill(CGRectMake(currentPoint.x, currentPoint.y, 2, 2));
    
    [points addLineToPoint:currentPoint];
    [points stroke];
}

/*
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
 */
                            




@end
