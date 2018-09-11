//
//  MTLBank.m
//  freeMarknad
//
//  Created by Daniel Mendez on 9/10/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "MTLBank.h"

@implementation MTLBank

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"id",
             @"name": @"name",
             @"thumbnail": @"secure_thumbnail",
             @"processingMode": @"processing_mode",
             @"status": @"status"
        };
}

@end
