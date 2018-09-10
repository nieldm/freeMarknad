//
//  MercadoPagoAPI.h
//  freeMarknad
//
//  Created by Daniel Mendez on 9/9/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MercadoPagoAPI : NSObject

+ (MercadoPagoAPI *)sharedAPI;

- (RACSignal *)paymentMethods;

@end
