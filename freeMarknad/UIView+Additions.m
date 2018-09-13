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

@end
