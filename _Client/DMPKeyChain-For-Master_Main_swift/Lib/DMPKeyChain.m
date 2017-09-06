//
//  DMPKeyChain.m
//  DMPKeyChainStore
//
//  Created by Nutchanon Viriyaprasart on 11/7/2559 BE.
//  Copyright © 2559 Nutchanon Viriyaprasart. All rights reserved.
//

#import "DMPKeyChain.h"
#import <UIKit/UIKit.h>

@interface DMPKeyChain ()

@property (nonatomic, strong) NSString *valueKey;
@property (nonatomic, strong) NSString *serviceKey;
@property (nonatomic, strong) UICKeyChainStore *keychain;

@end

@implementation DMPKeyChain

+ (DMPKeyChain *)sharedInstance {
    static DMPKeyChain *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DMPKeyChain alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

+ (void)initializeWithService:(NSString *)service forKey:(NSString *)key {
    [DMPKeyChain sharedInstance].serviceKey = service;
    [DMPKeyChain sharedInstance].valueKey = key;
    [DMPKeyChain sharedInstance].keychain = [UICKeyChainStore keyChainStoreWithService:service];
}

+ (void)saveKeyChainValueString:(NSString *)valueString OnComplete:(void (^)(BOOL success))block {
    NSError *error;
    [[DMPKeyChain sharedInstance].keychain setString:valueString forKey:[DMPKeyChain sharedInstance].valueKey error:&error];
    if (!error) {
        NSLog(@"DMPKeyChain save success : %@", valueString);
        if (block) block(YES);
    } else {
        NSLog(@"DMPKeyChain save error : %@", error.localizedDescription);
        if (block) block(NO);
    }
}

+ (void)valueStringKeyChainOnComplete:(void (^)(BOOL success, NSString *valueString))block {
    NSError *error;
    NSString *valueString = [[DMPKeyChain sharedInstance].keychain stringForKey:[DMPKeyChain sharedInstance].valueKey error:&error];
    if (!error) {
        NSLog(@"DMPKeyChain get success : %@", valueString);
        if (block) block(YES, valueString);
    } else {
        NSLog(@"DMPKeyChain get error : %@", error.localizedDescription);
        if (block) block(NO, nil);
    }
}

+ (void)removeKeyChainOnComplete:(void (^)(BOOL success))block {
    
    BOOL removed = [[DMPKeyChain sharedInstance].keychain removeItemForKey:[DMPKeyChain sharedInstance].valueKey];
    if (removed) {
        NSLog(@"DMPKeyChain remove success");
        [DMPKeyChain sharedInstance].currentDeviceID = nil;
        if (block) block(YES);
    } else {
        NSLog(@"DMPKeyChain remove fail");
        if (block) block(NO);
    }
}

+ (BOOL)isKeyChainStore {
    
    if ([[[DMPKeyChain sharedInstance].keychain stringForKey:[DMPKeyChain sharedInstance].valueKey] isKindOfClass:[NSString class]] &&
        [[DMPKeyChain sharedInstance].keychain stringForKey:[DMPKeyChain sharedInstance].valueKey] != nil) {
        return YES;
    } else {
        return NO;
    }
}



#pragma mark - 
#pragma mark - For 3 Apps (TrueID/TrueMusic/TrueVideo)

+ (void)generateDeviceIdOnComplete:(void (^)(BOOL success, NSString *valueString))block {
    
    if ([self isKeyChainStore]) {
        [self valueStringKeyChainOnComplete:^(BOOL success, NSString *valueString){
            if (success) {
                [DMPKeyChain sharedInstance].currentDeviceID = valueString;
                if (block) block(YES, valueString);
            } else {
                [DMPKeyChain sharedInstance].currentDeviceID = nil;
                if (block) block(NO, nil);
            }
        }];
    } else {
        NSString *device_id = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        [self saveKeyChainValueString:device_id OnComplete:^(BOOL success){
            if (success) {
                [DMPKeyChain sharedInstance].currentDeviceID = device_id;
                if (block) block(YES, device_id);
            } else {
                [DMPKeyChain sharedInstance].currentDeviceID = nil;
                if (block) block(NO, nil);
            }
        }];
    }
}



@end
