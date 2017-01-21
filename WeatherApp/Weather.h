//
//  Weather.h
//  WeatherApp
//
//  Created by enghong on 21/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

@interface Weather : NSObject

enum weatherType {current, forecast}

@property (nonatomic) NSString *city;
@property (nonatomic) NSString *country;
@property (nonatomic) NSDate *weatherDate; //Same as condition date or forecast date
@property (nonatomic) NSString *weatherText; //Same as forecast text
@property (nonatomic) NSUnitTemperature *conditionTemperature;
@property (nonatomic) NSUnitTemperature *forecastLow;
@property (nonatomic) NSUnitTemperature *forecastHigh;



@end
