#import "RVMViewModel.h"

@class FMTransaction;

@interface PaymentMethodViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;

@property (nonatomic, strong) NSString *paymentMethod;

@end
