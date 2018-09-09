#import "PaymentMethodViewModel.h"

//Models
#import "../../Models/FMTransaction.h"

@interface PaymentMethodViewModel ()

@property (nonatomic, strong) FMTransaction *model;

@end

@implementation PaymentMethodViewModel

-(instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    RACChannelTo(self, paymentMethod) = RACChannelTo(self.model, paymentMethod);
    
    return self;
}

@end
