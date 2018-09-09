//
//  EnterAmountViewModel.m
//  freeMarknad
//
//  Created by Daniel Mendez on 9/9/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "EnterAmountViewModel.h"

//Models
#import "../../Models/FMTransaction.h"

//View Controllers
#import "../PaymentMethod/PaymentMethodVC.h"

//View Models
#import "../PaymentMethod/PaymentMethodViewModel.h"

@interface EnterAmountViewModel ()

@property (nonatomic, strong) FMTransaction *model;

@end

@implementation EnterAmountViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;

    RACChannelTo(self, amount) = RACChannelTo(self.model, amount);
    
    return self;
}

- (PaymentMethodVC *)paymentMethod {
    PaymentMethodVC *vc = [[PaymentMethodVC alloc] init];
    PaymentMethodViewModel *viewModel = [[PaymentMethodViewModel alloc] initWithModel:self.model];
    vc.viewModel = viewModel;
    return vc;
}

@end
