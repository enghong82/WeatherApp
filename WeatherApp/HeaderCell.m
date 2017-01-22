//
//  HeaderCell.m
//  WeatherApp
//
//  Created by enghong on 22/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setWeather:(Weather *)weather {

    _weather = weather;
    [self updateCellDisplay];
}

- (void) updateCellDisplay {
    self.weatherDateLabel.text = self.weather.weatherDate;
    self.weatherTextLabel.text = self.weather.weatherText;
    self.conditionTemperatureLabel.text = self.weather.conditionTemperature;
}


@end
