//
//  WeatherAPI.m
//  WeatherApp
//
//  Created by enghong on 21/1/17.
//  Copyright © 2017 enghong. All rights reserved.
//

#import "AFNetworking.h"
#import "WeatherAPI.h"

@implementation WeatherAPI

//Singleton creation
//Reference: http://www.galloway.me.uk/tutorials/singleton-classes/

+ (instancetype)sharedInstance{
    static WeatherAPI *sharedWeatherAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedWeatherAPI = [[self alloc] init];
    });
    return sharedWeatherAPI;
}

- (void) getWeathersWithCompletion:(void (^)(Weather *currentWeatherCondition, NSArray *forecastsArray, NSError *error))callbackBlock {

    NSString *urlString = @"https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20%28select%20woeid%20from%20geo.places%281%29%20where%20text%3D%22singapore%2C%20sg%22%29&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *task = [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {

        NSDictionary *jsonDict = (NSDictionary *) responseObject;

        //Retrieve city and country
        NSDictionary *location =
        [[[[jsonDict objectForKey:@"query"]
                        objectForKey:@"results"]
                            objectForKey:@"channel"]
                                objectForKey:@"location"];

        //Retrieve condition for current time.
        NSDictionary *condition =
        [[[[[jsonDict objectForKey:@"query"]
                        objectForKey:@"results"]
                            objectForKey:@"channel"]
                                objectForKey:@"item"]
                                    objectForKey:@"condition"];
        //Retrieve forecasts.
        NSArray *forecasts =
        [[[[[jsonDict objectForKey:@"query"]
                        objectForKey:@"results"]
                            objectForKey:@"channel"]
                                objectForKey:@"item"]
                                    objectForKey:@"forecast"];

        //Parse JSON to objects.

        //Current Weather Condition
        Weather *currentWeatherCondition = [[Weather alloc] init];
        [currentWeatherCondition setCity:[location objectForKey:@"city"]];
        [currentWeatherCondition setCountry:[location objectForKey:@"country"]];
        [currentWeatherCondition setType:CurrentCondition];
        [currentWeatherCondition setConditionTemperature:[condition objectForKey:@"temp"]];
        [currentWeatherCondition setWeatherText:[condition objectForKey:@"text"]];
        [currentWeatherCondition setWeatherDate:[condition objectForKey:@"date"]];

        //Forecast weathers
        NSMutableArray *forecastsArray = [[NSMutableArray alloc] init];

        for (NSDictionary *forecast in forecasts) {

            Weather *weather = [[Weather alloc] init];
            NSString *dateString = [forecast objectForKey:@"date"];
            NSString *dayString = [forecast objectForKey:@"day"];

            [weather setWeatherDate:([[dateString stringByAppendingString:@", "] stringByAppendingString:dayString])];
            [weather setType:Forecast];
            [weather setWeatherText:[forecast objectForKey:@"text"]];
            [weather setForecastLow:[forecast objectForKey:@"low"]];
            [weather setForecastHigh:[forecast objectForKey:@"high"]];
            [weather setCity:[location objectForKey:@"city"]];
            [weather setCountry:[location objectForKey:@"country"]];

            [forecastsArray addObject:weather];
        }

        callbackBlock(currentWeatherCondition, forecastsArray, nil);
    } failure:^(NSURLSessionDataTask * task, NSError *error) {
        callbackBlock(nil,nil, error);
    }];

    [task resume];
}





@end
