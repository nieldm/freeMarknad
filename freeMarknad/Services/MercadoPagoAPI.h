#import <Foundation/Foundation.h>

@interface MercadoPagoAPI : NSObject

+ (MercadoPagoAPI *)sharedAPI;

- (RACSignal *)paymentMethods;
- (RACSignal *)banks:(NSString *)paymentMethodId;
- (RACSignal *)installments:(NSString *)paymentMethodId withAmount:(float)amount withBank:(NSString *)bankId;

@end
