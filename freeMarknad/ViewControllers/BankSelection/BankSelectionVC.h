#import <UIKit/UIKit.h>

#import "BankSelectionViewModel.h"

@interface BankSelectionVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BankSelectionViewModel *viewModel;

@end
