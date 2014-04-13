//
//  EtchViewController.h
//  EtchASketch
//
//  Created by Lewis Cooper on 4/11/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EtchView.h"

@interface EtchViewController : UIViewController

@property (weak, nonatomic) IBOutlet EtchView *etchView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (nonatomic) CGFloat lastVelocity;
- (IBAction)addHorizontal:(id)sender;
- (IBAction)addVertical:(id)sender;

@end
