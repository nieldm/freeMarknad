#import "RVMViewModel.h"

@class FMTransaction, InstallmentSelectionVC;

@interface BankSelectionViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;
@property (nonatomic, strong) NSArray *results;

-(InstallmentSelectionVC *)didSelect:(NSIndexPath *)indexPath;

@end
