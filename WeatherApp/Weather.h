//
//  Weather.h
//  WeatherApp
//
//  Created by enghong on 21/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

typedef NS_ENUM(NSInteger, WeatherType) {
    CurrentCondition,
    Forecast
};

@property (nonatomic) WeatherType type;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *weatherDate; //Same as condition date or forecast date
@property (nonatomic) NSString *weatherText; //Same as forecast text
@property (nonatomic) NSString *conditionTemperature;
@property (nonatomic) NSString *forecastLow;
@property (nonatomic) NSString *forecastHigh;



@end
