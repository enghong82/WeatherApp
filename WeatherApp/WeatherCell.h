//
//  WeatherCell.h
//  WeatherApp
//
//  Created by enghong on 22/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *weatherDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLowHighLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTextLabel;
@property (nonatomic) Weather *weather;

@end
