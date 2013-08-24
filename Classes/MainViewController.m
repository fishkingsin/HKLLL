//
//  MainViewController.m
//  HongKongLinkLink
//
//  Created by James Kong on 8/17/13.
//
//

#import "MainViewController.h"
#import "IntroLayer.h"
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize bannerView, adIsVisible, contentView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view.
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark iAds Banner Methods

- (int)getBannerHeight:(UIDeviceOrientation)orientation {
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        return 32;
    } else {
        return 50;
    }
}

- (int)getBannerHeight {
    return [self getBannerHeight:[UIDevice currentDevice].orientation];
}

- (void)fixupAdView:(UIInterfaceOrientation)toInterfaceOrientation {
    if (bannerView != nil) {
//        if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
//            [bannerView setCurrentContentSizeIdentifier:
//             ADBannerContentSizeIdentifierLandscape];
//        } else {
//            [bannerView setCurrentContentSizeIdentifier:
//             ADBannerContentSizeIdentifierPortrait];
//        }
        
        [UIView beginAnimations:@"fixupViews" context:nil];
        if (adIsVisible) {
            CGRect adBannerViewFrame = [bannerView frame];
            adBannerViewFrame.origin.x = 0;
            adBannerViewFrame.origin.y = 0;
            [bannerView setFrame:adBannerViewFrame];
            CGRect contentViewFrame = contentView.frame;
            contentViewFrame.origin.y = [self getBannerHeight:toInterfaceOrientation];
            contentViewFrame.size.height = self.view.frame.size.height - [self getBannerHeight:toInterfaceOrientation];
            contentView.frame = contentViewFrame;
        } else {
            CGRect adBannerViewFrame = [bannerView frame];
            adBannerViewFrame.origin.x = 0;
            adBannerViewFrame.origin.y = -[self getBannerHeight:toInterfaceOrientation];
            [bannerView setFrame:adBannerViewFrame];
            CGRect contentViewFrame = contentView.frame;
            contentViewFrame.origin.y = 0;
            contentViewFrame.size.height = self.view.frame.size.height;
            contentView.frame = contentViewFrame;
        }
        [UIView commitAnimations];
    }
}

- (void)createAdBannerView {
    Class classAdBannerView = NSClassFromString(@"ADBannerView");
    if (classAdBannerView != nil) {
        self.bannerView = [[[classAdBannerView alloc] initWithFrame:CGRectZero] autorelease];
        
//        [bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
//                                                       ADBannerContentSizeIdentifierPortrait,
//                                                       ADBannerContentSizeIdentifierLandscape, nil]];
//        
//        if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
//            [bannerView setCurrentContentSizeIdentifier: ADBannerContentSizeIdentifierLandscape];
//        } else {
//            [bannerView setCurrentContentSizeIdentifier: ADBannerContentSizeIdentifierPortrait];
//        }
        [bannerView setFrame:CGRectOffset([bannerView frame], 0, -[self getBannerHeight])];
        [bannerView setDelegate:self];
        
        [self.view addSubview:bannerView];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Obtain the shared director in order to...
    CCDirector *director = [CCDirector sharedDirector];
    
    // Turn on multiple touches
    EAGLView *eaglView = [director openGLView];
    [eaglView setMultipleTouchEnabled:YES];
    
    [self.view addSubview:eaglView];
    
    [self createAdBannerView];
    
    [[CCDirector sharedDirector] runWithScene: [IntroLayer node]]; // here I load my Cocos2D CCScene
}
                                              
#pragma mark -
#pragma mark ADBannerViewDelegate
                                              
- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
  if (!adIsVisible) {
      adIsVisible = YES;
      [self fixupAdView:[UIDevice currentDevice].orientation];
  }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
    {
        if (adIsVisible)
        {
            adIsVisible = NO;
            [self fixupAdView:[UIDevice currentDevice].orientation];
        }
    }
                                              
                                              - (void)viewDidUnload
    {
        [super viewDidUnload];
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;
    }
                                              
                                              - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        // Return YES for supported orientations
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
                                              

@end
