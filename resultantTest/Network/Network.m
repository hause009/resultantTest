//
//  Network.m
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "Network.h"
#import "City.h"

@implementation Network

+ (void)loadCitiesWithCompletion:(void (^)(NSArray * cities, NSError* error))completion {
  NSURL *url = [NSURL URLWithString:@"http://atw-backend.azurewebsites.net/api/countries"];
  [[[NSURLSession sharedSession]
    dataTaskWithURL:url completionHandler:^(NSData* data,NSURLResponse * response, NSError *error) {
      if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(nil, error);
          return;
        });
      }
      
      NSError * jsonError;
      NSDictionary * filesJSON = [NSJSONSerialization
                                  JSONObjectWithData:data
                                  options:NSJSONReadingAllowFragments
                                  error:&jsonError];
      if (jsonError != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
          completion(nil, jsonError);
          return;
        });
      }
      
      NSArray * array = [filesJSON objectForKey:@"Result"];
      NSMutableArray *result = [NSMutableArray array];
      for (NSDictionary* country in array) {
        NSArray *cities = country[@"Cities"];
        for (NSDictionary *cityDictionary in cities) {
          City *city = [[City alloc] initWithDictionary:cityDictionary];
          [result addObject:city];
        }
      }
      dispatch_async(dispatch_get_main_queue(), ^{
        completion(result, nil);
      });
      
    }] resume];
 
}

@end
