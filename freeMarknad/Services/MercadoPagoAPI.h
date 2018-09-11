#import <Foundation/Foundation.h>

@interface MercadoPagoAPI : NSObject

+ (MercadoPagoAPI *)sharedAPI;

- (RACSignal *)paymentMethods;
- (RACSignal *)banks:(NSString *)paymentMethodId;

@end
