//
//  MainViewController.h
//  HongKongLinkLink
//
//  Created by James Kong on 8/17/13.
//
//

#import <UIKit/UIKit.h>
#import "iAd/ADBannerView.h"
#import "cocos2d.h"
@interface MainViewController : UIViewController <ADBannerViewDelegate> {
    UIWindow            *window;
    BOOL adIsVisible;
    /*
     Note that we declare the iAd banner view as an id variable rather than as a ADBannerView.
     This is because we want to ensure backwards compatibility all the way to OS 3.0, and the
     ADBannerView class is only available on 4.0+, so we need to weak link against it */
    id bannerView;
    
    UIView *contentView;
}

@property (nonatomic, retain) IBOutlet UIView *contentView;
@property (nonatomic, retain) id bannerView;
@property (nonatomic) BOOL adIsVisible;
@end
