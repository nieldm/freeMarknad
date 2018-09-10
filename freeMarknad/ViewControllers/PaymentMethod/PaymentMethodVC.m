#import "PaymentMethodVC.h"

#import "PaymentMethodViewModel.h"

#import "../../Services/MercadoPagoAPI.h"

@interface PaymentMethodVC ()

@end

@implementation PaymentMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    [[[MercadoPagoAPI sharedAPI] paymentMethods] subscribeNext:^(id x) {
        printf("OH");
    }];
}

@end
