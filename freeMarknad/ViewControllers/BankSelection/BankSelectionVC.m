#import "BankSelectionVC.h"

//Cell
#import "BankTVCell.h"

//Models
#import "../../Models/FromService/MTLBank.h"

@interface BankSelectionVC ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BankSelectionVC

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *titleLabel = [self.view addTitleLabel:@"Seleccione su banco"];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setRowHeight:60];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView registerNib:[UINib nibWithNibName:@"BankTVCell" bundle:nil] forCellReuseIdentifier:@"BankTVCell"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
        make.width.equalTo(self.view).multipliedBy(0.95);
        make.centerX.equalTo(self.view);
    }];
    self.tableView = tableView;

    [self.view addGradientView];
    [self reactiveBind];
}

- (void)reactiveBind {
    @weakify(self);
    [RACObserve(self.viewModel, results) subscribeNext:^(id x) {
        @strongify(self);
        [self.tableView reloadData];
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BankTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BankTVCell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
    MTLBank *data = [self.viewModel.results objectAtIndex:indexPath.section];
    [cell setData:data];
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.borderColor = [[UIColor whiteColor] CGColor];
    cell.layer.borderWidth = 1;
    cell.layer.cornerRadius = 4;
    cell.clipsToBounds = YES;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.results.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    [header setBackgroundColor:[UIColor clearColor]];
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *vc = (UIViewController *) [self.viewModel didSelect:indexPath];
    if (vc != nil) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
