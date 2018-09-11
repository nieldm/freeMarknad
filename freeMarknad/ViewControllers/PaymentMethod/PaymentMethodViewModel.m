#import "PaymentMethodViewModel.h"

//View controllers
#import "../BankSelection/BankSelectionVC.h"

//View Models
#import "../BankSelection/BankSelectionViewModel.h"

//Models
#import "../../Models/FMTransaction.h"
#import "../../Models/FromService/MTLPaymentMethod.h"

//API
#import "../../Services/MercadoPagoAPI.h"

@interface PaymentMethodViewModel ()

@property (nonatomic, strong) FMTransaction *model;

@end

@implementation PaymentMethodViewModel

-(instancetype)initWithModel:(id)model {
    self = [super initWithModel:model];
    if (self == nil) return nil;
    
    RACChannelTo(self, paymentMethod) = RACChannelTo(self.model, paymentMethod);
    [[[MercadoPagoAPI sharedAPI] paymentMethods] subscribeNext:^(id response) {
        self.results = [response filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id object, NSDictionary *bindings) {
            MTLPaymentMethod *method = object;
            return [method.paymentTypeId isEqual: @"credit_card"] &&
                   [method.status isEqual: @"active"];
        }]];
    } error:^(NSError *error) {
        
    } completed:^{
        
    }];
    
    return self;
}

-(BankSelectionVC *)didSelect:(NSIndexPath *)indexPath {
    MTLPaymentMethod *method = [self.results objectAtIndex:indexPath.row];
    self.paymentMethod = method.id;
    self.model.cardName = method.name;
    self.model.cardIcon = method.thumbnail;
    BankSelectionViewModel *viewModel = [[BankSelectionViewModel alloc] initWithModel:self.model];
    BankSelectionVC *vc = [[BankSelectionVC alloc] init];
    vc.viewModel = viewModel;
    return vc;
}

@end
