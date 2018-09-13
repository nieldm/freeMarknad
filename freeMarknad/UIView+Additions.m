#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)addGradientView {
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor gradientTop] CGColor],
                            (id)[[UIColor gradientBottom] CGColor], nil
                            ];
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)addTitleLabel:(NSString *)title {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = title;
    [titleLabel setFont:[UIFont systemFontOfSize:25 weight:UIFontWeightMedium]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setNumberOfLines:2];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.7);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.mas_safeAreaLayoutGuideTop).offset(25);
        } else {
            make.top.equalTo(self.mas_topMargin).offset(45);
        }
    }];
}

@end
