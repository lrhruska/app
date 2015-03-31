//
//  SecondViewController.h
//  This-Or-That
//
//  Created by Lukas Hruska on 3/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *thisString;
@property (nonatomic, strong) IBOutlet UITextField *thatString;

- (IBAction) newQuestion;
@end

