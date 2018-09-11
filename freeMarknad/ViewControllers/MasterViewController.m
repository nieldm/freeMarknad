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
    UIViewController *vc = (UIViewController *) [self.viewModel enterAmount];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
