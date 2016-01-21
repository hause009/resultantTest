//
//  City.m
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "City.h"

static NSString *cityIdKey = @"kCityIdKey";
static NSString *countryIdKey = @"kCountryIdKey";
static NSString *nameKey = @"kNameKey";

@implementation City

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _cityId = [dictionary[@"Id"] integerValue];
        _countryId = [dictionary[@"CountryId"] integerValue];
        _name = dictionary[@"Name"];
    }
    return self;
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
  self = [super init];
  if (self) {
    _cityId = [aDecoder decodeIntegerForKey:cityIdKey];
    _countryId = [aDecoder decodeIntegerForKey:countryIdKey];
    _name = [aDecoder decodeObjectForKey:nameKey];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeInteger:_cityId forKey:cityIdKey];
  [aCoder encodeInteger:_countryId forKey:countryIdKey];
  [aCoder encodeObject:_name forKey:nameKey];
}

@end
