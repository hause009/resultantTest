//
//  UserDefaultsSettings.h
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsSettings : NSObject

@property (nonatomic, strong) NSArray *cities;

+ (instancetype)sharedSettingsManager;

@end
