//
//  ViewController.h
//  WeatherApp
//
//  Created by enghong on 19/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *forecastsArray;
@property Weather *currentWeatherCondition;

@end

