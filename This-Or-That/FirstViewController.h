//
//  FirstViewController.h
//  This-Or-That
//
//  Created by Lukas Hruska on 3/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingThis;


- (IBAction)fetchGreeting;


@end

