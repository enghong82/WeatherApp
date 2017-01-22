//
//  ViewController.m
//  WeatherApp
//
//  Created by enghong on 19/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import "ViewController.h"
#import "WeatherAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[WeatherAPI sharedInstance] getWeathersWithCompletion:^(Weather *currentWeatherCondition, NSArray *forecastsArray, NSError *error) {

    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
