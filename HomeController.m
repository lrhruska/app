//
//  HomeController.m
//  This-Or-That
//
//  Created by Varun Tolani on 4/24/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import "HomeController.h"
@import CoreLocation;
@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.schoolTitle adjustsFontSizeToFitWidth];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CLLocation *) getLocation {
    //    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    return [self.locationManager location];
}

- (IBAction)locationButtonClicked {
    CLLocationCoordinate2D currLocation = [[self getLocation] coordinate];
    NSNumber* latitude = [[NSNumber alloc] initWithDouble:currLocation.latitude];
    NSNumber* longitude = [[NSNumber alloc] initWithDouble:currLocation.longitude];
    NSDictionary *location = @{@"latitude": latitude, @"longitude": longitude};
    NSData *requestData = [NSJSONSerialization dataWithJSONObject:location options:nil error:nil];
    
    NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/findSchool"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (connectionError == nil)
         {
             NSArray *result = [NSJSONSerialization JSONObjectWithData:data
                                                               options:0
                                                                 error:NULL];
             self.schoolName = (NSString*) [result firstObject];
             
             /*this fails for null values and out of bounds of json array*/
             //             self.greetingId.text = [[results[cnt] objectForKey:@"id"] stringValue];
             //             self.greetingThis.text = [results[cnt] objectForKey:@"this"];
             self.schoolTitle.text = self.schoolName;
         }
     }];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
