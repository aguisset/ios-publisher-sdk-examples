//
//  InterstitialViewController.m
//  AppBidding-MoPub
//
//  Created by Abdoul Guisset on 7/2/20.
//  Copyright © 2020 Abdoul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InterstitialViewController.h"
#import "AdConfigurations.h"
@import CriteoPublisherSdk;

@interface InterstitialViewController ()
@property (weak, nonatomic) IBOutlet UIButton *displayInterstitialButton;

@end


@implementation InterstitialViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    
    // Instantiate the interstitial using the class convenience method.
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:[AdConfigurations mopubInterstitialAdUnitId]];
    
    self.interstitial.delegate = self;
    [self loadInterstitial];
}


- (void)loadInterstitial {
    
    //MoPub Instantiation
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:[AdConfigurations mopubInterstitialAdUnitId]];
    // add criteo
    [[Criteo sharedCriteo] setBidsForRequest:self.interstitial withAdUnit:[AdConfigurations criteoInterstitialAdUnit]];

    // Fetch the interstitial ad.
    [self.interstitial loadAd];
}

- (IBAction)displayInterstitial {
    
    if(self.interstitial.ready) {
        [self.interstitial showFromViewController:self];
        self.displayInterstitialButton.enabled = NO;
        
        // Ad loaded; play the ad
        [self.interstitial showFromViewController:self];
    }
    
}

//if pre fetch successfully
-(void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    
    self.displayInterstitialButton.enabled = YES;
    [self.displayInterstitialButton setTitle:@"Display Interstitial" forState:UIControlStateNormal];
    
}


-(void)interstitialDidFailToLoadAd:(MPInterstitialAdController *)interstitial withError:(NSError *)error {
    self.displayInterstitialButton.enabled = NO;
    [self.displayInterstitialButton setTitle:@"Ad Failed to Load" forState:UIControlStateNormal];
}
@end
