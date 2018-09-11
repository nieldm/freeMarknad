#import "InstallmentViewModel.h"

//View Controllers
#import "../TransactionResult/TransactionResultVC.h"

//View Models
#import "../TransactionResult/TransactionViewModel.h"

//Models
#import "../../Models/FMTransaction.h"
#import "../../Models/FromService/MTLPaymentMethod.h"
#import "../../Models/FromService/MTLInstallment.h"

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

-(TransactionResultVC *)didSelect:(NSIndexPath *)indexPath {
    MTLInstallment *installment = [self.results objectAtIndex:indexPath.row];
    self.model.installmentAmount = installment.installmentAmount;
    self.model.numberOfInstallments = [[NSNumber numberWithLong:installment.numberOfInstallments] floatValue];
    self.model.installmentMessage = installment.recommendedMessage;
    TransactionViewModel *viewModel = [[TransactionViewModel alloc] initWithModel:self.model];
    TransactionResultVC *vc = [[TransactionResultVC alloc] init];
    vc.viewModel = viewModel;
    return vc;
}

@end
