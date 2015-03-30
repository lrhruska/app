//
//  Rest:RestViewController.h
//  This-Or-That
//
//  Created by Lukas Hruska on 3/26/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface RestViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *greetingId;
@property (nonatomic, strong) IBOutlet UILabel *greetingContent;

- (IBAction)fetchGreeting;

@end

