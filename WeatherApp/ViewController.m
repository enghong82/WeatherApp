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

    [[WeatherAPI sharedInstance] getWeathersWithCompletion:^(Weather *currentWeatherCondition, NSArray *forecastsArray, NSError *error) {

        self.forecastsArray = [forecastsArray mutableCopy];
        self.currentWeatherCondition = currentWeatherCondition;
        [[self tableView] reloadData];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self forecastsArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    static NSString *weatherCellIdentifier = @"WeatherCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weatherCellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weatherCellIdentifier];
    }

    cell.textLabel.text = [self.forecastsArray[indexPath.row] weatherDate];

    return cell;
}






@end
