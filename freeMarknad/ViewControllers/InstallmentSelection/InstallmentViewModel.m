#import "InstallmentViewModel.h"

//Models
#import "../../Models/FMTransaction.h"
#import "../../Models/FromService/MTLPaymentMethod.h"

//API
#import "../../Services/MercadoPagoAPI.h"

@implementation InstallmentViewModel

-(instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    [[[MercadoPagoAPI sharedAPI] installments:self.model.paymentMethod withAmount:self.model.amount withBank:self.model.bankId] subscribeNext:^(id x) {
        self.results = x;
    }];
    
    return self;
}

@end
