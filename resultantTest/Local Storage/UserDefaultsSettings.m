//
//  UserDefaultsSettings.m
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "UserDefaultsSettings.h"

static NSString *kCities = @"kCitiesKey";

@implementation UserDefaultsSettings

+ (instancetype)sharedSettingsManager {
    static UserDefaultsSettings *_userDefaultsSettings;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userDefaultsSettings = [UserDefaultsSettings new];
    });
    return _userDefaultsSettings;
}

#pragma mark - Accessors

- (void)setCities:(NSArray *)cities{
  if (cities) {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cities];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kCities];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

- (NSArray *)cities{
  NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kCities];
  if (data) {
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
  }
  return nil;
}


@end
