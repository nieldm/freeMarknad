#import "MasterViewController.h"
#import "MasterViewModel.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.viewModel.active = YES;
    
    [self.navigationController pushViewController:[self.viewModel enterAmount] animated:YES];
}

@end
