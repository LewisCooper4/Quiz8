//
//  EtchViewController.m
//  EtchASketch
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "EtchViewController.h"

@interface EtchViewController ()

@end

@implementation EtchViewController
@synthesize etchView;
@synthesize backgroundImage;

@synthesize lastVelocity;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{

    [self setBackgroundImage:nil];
    [self setEtchView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)addHorizontal:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal", s.rotation);
    
    CGPoint currPoint = [etchView currentPoint];
    
    if (s.velocity < 0) {
        currPoint.x = currPoint.x - fabs(s.rotation);
    }
    else if (s.velocity > 0) {
        currPoint.x = currPoint.x + fabs(s.rotation);
    }
    
    if (currPoint.x < 0) {
        currPoint.x = 0;
    }
    else if (currPoint.x > etchView.bounds.size.width - 1) {
        currPoint.x = etchView.bounds.size.width - 1;
    }
    
    etchView.currentPoint = CGPointMake(currPoint.x, currPoint.y);
    
    [etchView setNeedsDisplay];
    
    s.rotation = 0;
    
}

- (IBAction)addVertical:(id)sender {
    
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians vertical", s.rotation);
    
    CGPoint currPoint = [etchView currentPoint];
    
    if (s.velocity < 0) {
        currPoint.y = currPoint.y - fabs(s.rotation);
    }
    else if (s.velocity > 0) {
        currPoint.y = currPoint.y + fabs(s.rotation);
    }
    
    if (currPoint.y < 0) {
        currPoint.y = 0;
    }
    else if (currPoint.y > etchView.bounds.size.height - 1) {
        currPoint.y = etchView.bounds.size.height - 1;
    }
        
    etchView.currentPoint = CGPointMake(currPoint.x, currPoint.y);
    
    [etchView setNeedsDisplay];
    
    s.rotation = 0;
}

- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake) {
        
        [etchView.points removeAllPoints];
        [etchView.points addLineToPoint:etchView.currentPoint];
        [etchView setNeedsDisplay];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}

@end
