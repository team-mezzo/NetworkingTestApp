//
//  ViewController.m
//  NetworkingTest
//
//  Created by Heejung Chung on 12/5/14.
//  Copyright (c) 2014 Mezzo. All rights reserved.
//

#import "ViewController.h"

#warning add base URL below
static NSString * const baseURLString = @"INSERT BASE URL";


@interface ViewController ()

@property (nonatomic, strong) NSDictionary *donation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadButtonTapped:(id)sender {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSDictionary *parameters = @{@"format" : @"json"};
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

#warning add key below
    [manager GET:@"INSERT KEY" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        self.donation = responseObject;
        NSLog(@"%@", self.donation);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Donation"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
}

@end
