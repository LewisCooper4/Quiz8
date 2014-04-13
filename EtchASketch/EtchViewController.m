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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)addHorizontal:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal", s.rotation);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.etchView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.etchView saveCurrentPoint];
    }
    [self.etchView setCurrentHorizontalAngle:s.rotation];
    [self.etchView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.etchView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (IBAction)addVertical:(id)sender {
    
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians vertical", s.rotation);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.etchView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.etchView saveCurrentPoint];
    }
    [self.etchView setCurrentVerticalAngle:s.rotation];
    [self.etchView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.etchView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

@end
