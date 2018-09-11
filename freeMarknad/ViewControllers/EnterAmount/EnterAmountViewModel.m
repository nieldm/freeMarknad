#import "EnterAmountViewModel.h"

//Models
#import "../../Models/FMTransaction.h"

//View Controllers
#import "../PaymentMethod/PaymentMethodVC.h"

//View Models
#import "../PaymentMethod/PaymentMethodViewModel.h"

@implementation EnterAmountViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;

    RACChannelTo(self, amount) = RACChannelTo(self.model, amount);
    
    return self;
}

- (PaymentMethodVC *)paymentMethodWithAmount: (NSString *)rawAmount {
    float amount = [rawAmount floatValue];
    self.model.amount = amount;
    PaymentMethodVC *vc = [[PaymentMethodVC alloc] init];
    PaymentMethodViewModel *viewModel = [[PaymentMethodViewModel alloc] initWithModel:self.model];
    vc.viewModel = viewModel;
    return vc;
}

@end
