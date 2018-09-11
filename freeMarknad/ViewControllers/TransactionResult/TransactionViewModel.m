#import "TransactionViewModel.h"

//Models
#import "../../Models/FMTransaction.h"
#import "../../Models/FromService/MTLPaymentMethod.h"
#import "../../Models/FromService/MTLInstallment.h"
#import "../../Models/FromService/MTLBank.h"

@implementation TransactionViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    RACChannelTo(self, amount) = RACChannelTo(self.model, amount);
    
    return self;
}

-(RACSignal *)paymentMethod {
    return [RACObserve(self, model) map:^id(id value) {
        MTLPaymentMethod *payment = [[MTLPaymentMethod alloc] init];
        payment.name = self.model.cardName;
        payment.thumbnail = self.model.cardIcon;
        return payment;
    }];
}

-(RACSignal *)installment {
    return [RACObserve(self, model) map:^id(id value) {
        MTLInstallment *installment = [[MTLInstallment alloc] init];
        installment.numberOfInstallments = self.model.numberOfInstallments;
        installment.installmentAmount = self.model.installmentAmount;
        installment.recommendedMessage = self.model.installmentMessage;
        return installment;
    }];
}

-(RACSignal *)bank {
    return [RACObserve(self, model) map:^id(id value) {
        MTLBank *bank = [[MTLBank alloc] init];
        bank.name = self.model.bankName;
        bank.thumbnail = self.model.bankIcon;
        return bank;
    }];
}

@end
