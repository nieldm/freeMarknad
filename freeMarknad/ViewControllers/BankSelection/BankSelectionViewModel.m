#import "BankSelectionViewModel.h"

//View Controllers
#import "../InstallmentSelection/InstallmentSelectionVC.h"

//View Models
#import "../InstallmentSelection/InstallmentViewModel.h"

//Models
#import "../../Models/FMTransaction.h"
#import "../../Models/FromService/MTLBank.h"

//API
#import "../../Services/MercadoPagoAPI.h"

@implementation BankSelectionViewModel

- (instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    [[[MercadoPagoAPI sharedAPI] banks:self.model.paymentMethod] subscribeNext:^(id x) {
        self.results = x;
    } error:^(NSError *error) {
        
    } completed:^{
        
    }];
    
    return self;
}

-(InstallmentSelectionVC *)didSelect:(NSIndexPath *)indexPath {
    MTLBank *bank = [self.results objectAtIndex:indexPath.section];
    self.model.bankId = bank.id;
    self.model.bankName = bank.name;
    self.model.bankIcon = bank.thumbnail;
    InstallmentViewModel *viewModel = [[InstallmentViewModel alloc] initWithModel:self.model];
    InstallmentSelectionVC *vc = [[InstallmentSelectionVC alloc] init];
    vc.viewModel = viewModel;
    return vc;
}

@end
