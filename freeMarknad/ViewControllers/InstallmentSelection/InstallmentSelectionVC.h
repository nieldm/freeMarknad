#import <UIKit/UIKit.h>

#import "InstallmentViewModel.h"

@interface InstallmentSelectionVC : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) InstallmentViewModel *viewModel;

@end
