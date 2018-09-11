#import "TransactionResultVC.h"

#import "../PaymentMethod/PaymentMethodCVCell.h"
#import "../InstallmentSelection/InstallmentCVCell.h"
#import "../BankSelection/BankTVCell.h"

//Models
#import "../../Models/FromService/MTLBank.h"

@interface TransactionResultVC ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *amountLabel;
@property (nonatomic, strong) UILabel *bankName;
@property (nonatomic, strong) PaymentMethodCVCell *paymentMethod;
@property (nonatomic, strong) InstallmentCVCell *installement;

@end

@implementation TransactionResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = @"Total a pagar";
    [titleLabel setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightLight]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(70);
        make.width.equalTo(self.view).multipliedBy(0.7);
        make.centerX.equalTo(self.view);
    }];
    self.titleLabel = titleLabel;
    
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [amountLabel setFont:[UIFont boldSystemFontOfSize:35]];
    [amountLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:amountLabel];
    [amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.width.equalTo(self.view).multipliedBy(0.7);
        make.centerX.equalTo(self.view);
    }];
    self.amountLabel = amountLabel;
    
    UILabel *bankName = [[UILabel alloc] initWithFrame:CGRectZero];
    [bankName setFont:[UIFont boldSystemFontOfSize:15]];
    [bankName setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:bankName];
    [bankName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.amountLabel.mas_bottom).offset(10);
        make.width.equalTo(self.view).multipliedBy(0.7);
        make.centerX.equalTo(self.view);
    }];
    self.bankName = bankName;
    
    PaymentMethodCVCell *paymentMethod = (PaymentMethodCVCell *) [[[UINib nibWithNibName:@"PaymentMethodCVCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:paymentMethod];
    [paymentMethod setBackgroundColor:[UIColor grayColor]];
    [paymentMethod mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bankName.mas_bottom).offset(25);
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.centerX.equalTo(self.view);
        make.height.equalTo(paymentMethod.mas_width).dividedBy(1.586);
    }];
    self.paymentMethod = paymentMethod;
    
    InstallmentCVCell *installement = (InstallmentCVCell *) [[[UINib nibWithNibName:@"InstallmentCVCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:installement];
    [installement setBackgroundColor:[UIColor grayColor]];
    [installement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.paymentMethod.mas_bottom).offset(25);
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.centerX.equalTo(self.view);
        make.height.equalTo(installement.mas_width).dividedBy(1.586);
    }];
    self.installement = installement;
    
    @weakify(self);
    [RACObserve(self.viewModel, amount) subscribeNext:^(id amount) {
        @strongify(self);
        float floatValue = [amount floatValue];
        self.amountLabel.text = [[NSNumber numberWithFloat:floatValue] currency];
    }];
    
    [[self.viewModel paymentMethod] subscribeNext:^(id data) {
        @strongify(self);
        [self.paymentMethod setData:data];
    }];
    
    [[self.viewModel installment] subscribeNext:^(id data) {
        @strongify(self);
        [self.installement setData:data];
    }];
    
    [[self.viewModel bank] subscribeNext:^(id data) {
        @strongify(self);
        self.bankName.text = [NSString stringWithFormat:@"Banco %@", ((MTLBank *)data).name];
        [self.paymentMethod setBank:((MTLBank *)data).thumbnail];
    }];
}

@end
