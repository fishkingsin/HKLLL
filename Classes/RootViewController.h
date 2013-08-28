//
//  RootViewController.h
//  HongKongLinkLink
//
//  Created by James Kong on 8/17/13.
//
//
#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import "cocos2d.h"

@interface RootViewController : UIViewController<ADBannerViewDelegate> {
    
    
    ADBannerView *bannerView;
    
}

@property (nonatomic,retain) ADBannerView *bannerView;

@end