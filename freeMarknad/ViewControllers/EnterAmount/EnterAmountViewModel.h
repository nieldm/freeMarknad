//
//  EnterAmountViewModel.h
//  freeMarknad
//
//  Created by Daniel Mendez on 9/9/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "RVMViewModel.h"

@class FMTransaction, PaymentMethodVC;

@interface EnterAmountViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;

@property (nonatomic) float amount;

- (PaymentMethodVC *)paymentMethod;

@end

