//
//  InstallmentViewModel.h
//  freeMarknad
//
//  Created by Daniel Mendez on 9/11/18.
//  Copyright © 2018 nieldm. All rights reserved.
//

#import "RVMViewModel.h"

@class FMTransaction;

@interface InstallmentViewModel : RVMViewModel

@property (nonatomic, readonly) FMTransaction *model;

@property (nonatomic, strong) NSArray *results;

@end
