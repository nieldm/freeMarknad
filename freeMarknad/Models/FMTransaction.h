//
//  FMTransaction.h
//  freeMarknad
//
//  Created by Daniel Mendez on 9/9/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface FMTransaction : NSManagedObject

@property (nonatomic) float amount;
@property (nonatomic, retain) NSString *paymentMethod;
@property (nonatomic, retain) NSString *bankId;
@property (nonatomic, retain) NSString *bankName;

@end
