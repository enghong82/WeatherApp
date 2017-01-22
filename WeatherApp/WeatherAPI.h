//
//  WeatherAPI.h
//  WeatherApp
//
//  Created by enghong on 21/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherAPI: NSObject

+ (instancetype) sharedInstance;

- (void) getWeathersWithCompletion:(void (^)(Weather *currentWeatherCondition, NSArray *forecastsArray, NSError *error))callbackBlock;




@end
