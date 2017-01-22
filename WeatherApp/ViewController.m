//
//  ViewController.m
//  WeatherApp
//
//  Created by enghong on 19/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import "ViewController.h"
#import "WeatherAPI.h"
#import "WeatherCell.h"
#import "HeaderCell.h"

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

    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:weatherCellIdentifier];

    if (cell == nil) {
        cell = [[WeatherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:weatherCellIdentifier];
    }

    cell.weather = self.forecastsArray[indexPath.row];

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    static NSString *headerCellIdentifier = @"HeaderCell";

    HeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:headerCellIdentifier];

    if (cell == nil) {
        cell = [[HeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerCellIdentifier];
    }

    cell.weather = self.currentWeatherCondition;

    self.tableView.tableHeaderView = cell;
    
    return cell;
}





@end
