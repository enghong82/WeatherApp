//
//  WeatherCell.m
//  WeatherApp
//
//  Created by enghong on 22/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import "WeatherCell.h"

@implementation WeatherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //Add Custom AccesoryView
    UIView *customAccessoryView = [[UIView alloc] init];
    UIImage *image = [UIImage imageNamed:@"accessory_arrow_red.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [customAccessoryView addSubview:imageView];

    self.accessoryView = customAccessoryView;
}

- (void) setWeather:(Weather *)weather {

    _weather = weather;
    [self updateCellDisplay];
}

- (void) updateCellDisplay {

    self.weatherDateLabel.text = self.weather.weatherDate;
    self.weatherTextLabel.text = self.weather.weatherText;

    NSString *lowHighString = [[self.weather.forecastLow stringByAppendingString:@" - "] stringByAppendingString:self.weather.forecastHigh];

    self.temperatureLowHighLabel.text = lowHighString;
}






@end
