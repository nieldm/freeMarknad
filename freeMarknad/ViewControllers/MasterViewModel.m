#import "MasterViewModel.h"

//Models
#import "../Models/FMTransaction.h"

//View Models
#import "EnterAmount/EnterAmountViewModel.h"

//View Controllers
#import "EnterAmount/EnterAmountVC.h"

@implementation MasterViewModel

-(EnterAmountVC *)enterAmount {
    FMTransaction *transaction = [NSEntityDescription insertNewObjectForEntityForName:@"FMTransaction" inManagedObjectContext:self.model];
    EnterAmountViewModel *viewModel = [[EnterAmountViewModel alloc] initWithModel:transaction];
    EnterAmountVC *vc = [[EnterAmountVC alloc] init];
    vc.viewModel = viewModel;
    return vc;
}

@end
