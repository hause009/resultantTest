//
//  Network.h
//  resultantTest
//
//  Created by Admin on 19.01.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Network : NSObject

+ (void)loadCitiesWithCompletion:(void (^)(NSArray * cities, NSError* error))completion;

@end
