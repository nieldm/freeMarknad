#import "InstallmentSelectionVC.h"

#import "../../Models/FromService/MTLInstallment.h"

#import "InstallmentCVCell.h"

@interface InstallmentSelectionVC ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation InstallmentSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addTitleLabel:@"Seleccion el número de cuotas"];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.sectionInset = UIEdgeInsetsMake(50, 50, 50, 50);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collectionView setDelegate:self];
    [collectionView setDataSource:self];
    [collectionView setBackgroundColor:[UIColor main]];
    [collectionView registerNib:[UINib nibWithNibName:@"InstallmentCVCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.5);
    }];
    self.collectionView = collectionView;

    [self reactiveBind];
    [self.view addGradientView];
}

- (void)reactiveBind {
    @weakify(self);
    [RACObserve(self.viewModel, results) subscribeNext:^(id x) {
        @strongify(self);
        [self.collectionView reloadData];
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    InstallmentCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    MTLInstallment *data = [self.viewModel.results objectAtIndex:indexPath.row];
    [cell setData:data];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.results.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width * 0.8;
    CGFloat height = width / 1.586;
    return CGSizeMake(width, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = (UIViewController *) [self.viewModel didSelect:indexPath];
    if (vc != nil) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
