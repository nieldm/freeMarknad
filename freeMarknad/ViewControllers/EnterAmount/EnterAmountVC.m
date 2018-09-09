#import "EnterAmountVC.h"

//View Models
#import "EnterAmountViewModel.h"

@interface EnterAmountVC ()

@property (nonatomic, strong) UITextField *amountTextField;
@property (nonatomic, strong) UIButton *payButton;

@end

@implementation EnterAmountVC

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];

    [self.navigationController setNavigationBarHidden:TRUE];

    _amountTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    [_amountTextField setBackgroundColor:[UIColor yellowColor]];
    [_amountTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [self.view addSubview:_amountTextField];
    [_amountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.7);
        make.height.mas_equalTo(45);
    }];

    _payButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_payButton setTitle:@"Pay" forState:UIControlStateNormal];
    [_payButton setUserInteractionEnabled:TRUE];
    [_payButton setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:_payButton];
    [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_amountTextField.mas_bottom).with.offset(12);
        make.centerX.equalTo(_amountTextField.mas_centerX);
        make.width.equalTo(_amountTextField.mas_width);
        make.height.mas_equalTo(45);
    }];
    
    // Reactive Bindings
    @weakify(self);
    [[_payButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *button) {
        @strongify(self);

        printf("CLICK!");
    }];
    
    [RACObserve(self.viewModel, amount) subscribeNext:^(id amount) {
        @strongify(self);
        float floatValue = [amount floatValue];
        self.amountTextField.text = [[NSNumber numberWithFloat:floatValue] stringValue];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
