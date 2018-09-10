#import "RVMViewModel.h"

@class FMTransaction, BankSelectionVC;

@interface PaymentMethodViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;

@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) NSString *paymentMethod;

-(BankSelectionVC *)didSelect:(NSIndexPath *)indexPath;

@end
