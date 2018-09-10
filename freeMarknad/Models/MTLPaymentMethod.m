//
//  MTLPaymentMethod.m
//  freeMarknad
//
//  Created by Daniel Mendez on 9/10/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "MTLPaymentMethod.h"

@implementation MTLPaymentMethod

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"id",
             @"name": @"name",
             @"thumbnail": @"secure_thumbnail",
             @"paymentTypeId": @"payment_type_id",
             @"status": @"status"
             };
}

@end
