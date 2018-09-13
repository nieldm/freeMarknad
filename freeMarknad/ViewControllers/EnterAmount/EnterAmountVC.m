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

    [self.view addTitleLabel:@"Ingrese el monto"];

    _amountTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    [_amountTextField setBackgroundColor:[UIColor colorWithHexString:@"383B4E"]];
    [_amountTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_amountTextField setFont:[UIFont systemFontOfSize:25 weight:UIFontWeightMedium]];
    [_amountTextField setTextAlignment:NSTextAlignmentCenter];
    [_amountTextField setTextColor:[UIColor whiteColor]];
    [_amountTextField setTintColor:[UIColor whiteColor]];
    [self.view addSubview:_amountTextField];
    [_amountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.7);
        make.height.mas_equalTo(60);
    }];
    [_amountTextField.layer setCornerRadius:6];

    _payButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_payButton setTitle:@"Pagar" forState:UIControlStateNormal];
    [_payButton.titleLabel setFont:[UIFont boldSystemFontOfSize:25]];
    [_payButton setUserInteractionEnabled:TRUE];
    [_payButton setBackgroundColor:[UIColor main]];
    [self.view addSubview:_payButton];
    [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_amountTextField.mas_bottom).with.offset(12);
        make.centerX.equalTo(_amountTextField.mas_centerX);
        make.width.equalTo(_amountTextField.mas_width);
        make.height.mas_equalTo(45);
    }];
    [_payButton.layer setCornerRadius:6];

    [self.view addGradientView];
    [self reactiveBind];
}

- (void)reactiveBind {
    @weakify(self);
    [[_payButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *button) {
        @strongify(self);
        UIViewController *vc = (UIViewController *) [self.viewModel paymentMethodWithAmount:self.amountTextField.text];
        if (vc != nil) {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:TRUE animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_amountTextField becomeFirstResponder];
}

@end
