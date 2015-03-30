//
//  FirstViewController.m
//  This-Or-That
//
//  Created by Lukas Hruska on 3/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

int cnt = 12;

- (IBAction)fetchGreeting;
{
    NSLog(@"Hello");
    NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/calpoly/getQuestions"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSArray *results = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
           //  self.greetingId.text = [[results objectForKey:@"id"] stringValue];
           //  self.greetingThis.text = [results objectForKey:@"this"];
           //  NSArray *resultArray = [results objectForKey:@"id"];
             
             /*this fails for null values and out of bounds of json array*/
             self.greetingId.text = [[results[cnt] objectForKey:@"id"] stringValue];
             self.greetingThis.text = [results[cnt] objectForKey:@"this"];
             
             //cnt is the index of the json array. stop at 15 since last element.
             if(cnt < 15) {
                 cnt++;
             }
         }
     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self fetchGreeting];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
