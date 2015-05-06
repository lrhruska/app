//
//  FirstViewController.m
//  This-Or-That
//
//  Created by Lukas Hruska on 3/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import "FirstViewController.h"
#import "TableViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

int cnt = 0;

- (IBAction)fetchGreeting
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/calpoly/getQuestions"];
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
             [TableViewController setQuestionData: results];
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
