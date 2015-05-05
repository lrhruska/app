//
//  HomeController.h
//  This-Or-That
//
//  Created by Varun Tolani on 4/24/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLLocationManager;

@interface HomeController : UIViewController
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet UILabel *schoolTitle;
-(IBAction) locationButtonClicked;
@property (nonatomic, strong) NSString* schoolName;
@end
