#import "RVMViewModel.h"

@class FMTransaction, MTLPaymentMethod;

@interface TransactionViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;

@property (nonatomic) float amount;

-(RACSignal *)paymentMethod;
-(RACSignal *)installment;
-(RACSignal *)bank;

@end
