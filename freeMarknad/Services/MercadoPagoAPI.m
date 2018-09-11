#import <Mantle.h>

#import "MercadoPagoAPI.h"

#import <AFNetworking.h>

#import "../Models/FromService/MTLPaymentMethod.h"
#import "../Models/FromService/MTLBank.h"
#import "../Models/FromService/MTLInstallment.h"

#import "PaymentService.h"

@implementation MercadoPagoAPI

NSString *const PublicKey = @"444a9ef5-8a6b-429f-abdf-587639155d88";

+ (MercadoPagoAPI *)sharedAPI
{
    static MercadoPagoAPI *_sharedController = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        Class klass = NSClassFromString(@"MercadoPagoAPI") ?: self;
        _sharedController = [[klass alloc] init];
    });
    
    return _sharedController;
}

- (RACSignal *)paymentMethods {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *rawURL = [PaymentService paymentMethod:PublicKey];
        NSURL *URL                      = [NSURL URLWithString:rawURL];
        AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
        NSURLSessionDataTask *session = [manager GET:URL.absoluteString
             parameters:nil
               progress:nil
                success:^(NSURLSessionTask *task, id responseObject) {
                    NSError *modelError = nil;
                    NSArray *model = [MTLJSONAdapter modelsOfClass:MTLPaymentMethod.class fromJSONArray:responseObject error:&modelError];
                    if (modelError == nil) {
                        [subscriber sendNext:model];
                        [subscriber sendCompleted];
                    } else {
                        [subscriber sendError:modelError];
                    }
                }
                failure:^(NSURLSessionTask *operation, NSError *error) {
                    [subscriber sendError:error];
                }
         ];
        return [RACDisposable disposableWithBlock:^{
            [session cancel];
        }];
    }];
}

- (RACSignal *)banks:(NSString *)paymentMethodId {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *rawURL = [PaymentService bank:PublicKey withPaymentMethod:paymentMethodId];
        NSURL *URL                      = [NSURL URLWithString:rawURL];
        AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
        NSURLSessionDataTask *session = [manager GET:URL.absoluteString
              parameters:nil
                progress:nil
                 success:^(NSURLSessionTask *task, id responseObject) {
                     NSError *modelError = nil;
                     NSArray *model = [MTLJSONAdapter modelsOfClass:MTLBank.class fromJSONArray:responseObject error:&modelError];
                     if (modelError == nil) {
                         [subscriber sendNext:model];
                         [subscriber sendCompleted];
                     } else {
                         [subscriber sendError:modelError];
                     }
                 }
                 failure:^(NSURLSessionTask *operation, NSError *error) {
                     [subscriber sendError:error];
                 }
             ];
        return [RACDisposable disposableWithBlock:^{
            [session cancel];
        }];
    }];
}

- (RACSignal *)installments:(NSString *)paymentMethodId withAmount:(float)amount withBank:(NSString *)bankId {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString *rawURL = [PaymentService installments:PublicKey withPaymentMethod:paymentMethodId withAmount:amount withBankId:bankId];
        NSURL *URL                      = [NSURL URLWithString:rawURL];
        AFHTTPSessionManager *manager   = [AFHTTPSessionManager manager];
        NSURLSessionDataTask *session = [manager GET:URL.absoluteString
              parameters:nil
                progress:nil
                 success:^(NSURLSessionTask *task, id responseObject) {
                     NSError *modelError = nil;
                     id data = ([responseObject count] > 0) ? [responseObject objectAtIndex:0] : nil;
                     id installmentsObject = nil;
                     if (data != nil) {
                         NSDictionary *dictionary = ((NSDictionary *)data);
                         installmentsObject = dictionary[@"payer_costs"];
                     }
                     if (installmentsObject != nil) {
                        NSArray *model = [MTLJSONAdapter modelsOfClass:MTLInstallment.class fromJSONArray:installmentsObject error:&modelError];
                         if (modelError == nil) {
                             [subscriber sendNext:model];
                             [subscriber sendCompleted];
                         } else {
                             [subscriber sendError:modelError];
                         }
                     } else {
                         [subscriber sendError:nil];
                     }
                 }
                 failure:^(NSURLSessionTask *operation, NSError *error) {
                     [subscriber sendError:error];
                 }
             ];
        return [RACDisposable disposableWithBlock:^{
            [session cancel];
        }];
    }];
}

@end
