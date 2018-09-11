#import "PaymentService.h"
#import "NetworkConstants.h"

@implementation PaymentService

+ (NSString *)paymentMethod:(NSString *)token {
    return [[NSString stringWithFormat: MLPaymentMethods, token] stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}

+ (NSString *)bank:(NSString *)token withPaymentMethod:(NSString *)paymentMethodId {
    NSString *url = [[NSString stringWithFormat: MLCardIssuer, token, paymentMethodId] stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    return [url stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}


@end
