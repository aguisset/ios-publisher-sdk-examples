//  Copyright © 2018-2020 Criteo. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//  BannerViewController.m
//  AppBidding-MoPub
//
//  Copyright © 2020 Criteo. All rights reserved.
//


#import "BannerViewController.h"
#import "AdConfigurations.h"
@import CriteoPublisherSdk;

@interface BannerViewController ()

@end

@implementation BannerViewController


// safeAreaInsets will be 0 if executed in viewDidLoad
- (void)viewDidAppear:(BOOL)animated {

    // Do any additional setup after loading the view.
    self.adView = [[MPAdView alloc] initWithAdUnitId:[AdConfigurations mopubBannerAdUnitId]];
    self.adView.delegate = self;
    self.adView.frame = CGRectMake(0, self.view.frame.size.height - self.view.safeAreaInsets.bottom - 50, self.view.frame.size.width, 50);
    [self.view addSubview:self.adView];

    // add Criteo bids into MoPub Ad View object
    [[Criteo sharedCriteo] setBidsForRequest:self.adView withAdUnit:[AdConfigurations criteoBannerAdUnit]];

    [self.adView loadAd]; // since the size is known in advance
}

- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}


@end

