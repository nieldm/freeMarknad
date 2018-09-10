#import <UIKit/UIKit.h>

@class PaymentMethodViewModel;

@interface PaymentMethodVC : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) PaymentMethodViewModel *viewModel;

@end
