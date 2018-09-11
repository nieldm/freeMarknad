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
@property (nonatomic, retain) NSString *installmentMessage;
@property (nonatomic) float installmentAmount;
@property (nonatomic) float numberOfInstallments;
@property (nonatomic, retain) NSString *bankIcon;
@property (nonatomic, retain) NSString *cardIcon;
@property (nonatomic, retain) NSString *cardName;


@end
