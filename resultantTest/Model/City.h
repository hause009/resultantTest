//
//  City.h
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject <NSCoding>

@property (nonatomic, assign) NSInteger cityId;
@property (nonatomic, assign) NSInteger countryId;
@property (nonatomic, strong) NSString * name;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end
