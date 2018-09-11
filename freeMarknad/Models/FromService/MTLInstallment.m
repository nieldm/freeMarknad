//
//  MTLInstallment.m
//  freeMarknad
//
//  Created by Daniel Mendez on 9/11/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "MTLInstallment.h"

@implementation MTLInstallment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"installmentAmount": @"installment_amount",
             @"numberOfInstallments": @"installments",
             @"recommendedMessage": @"recommended_message",
         };
}

@end
