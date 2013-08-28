//
//  RootViewController.m
//  HongKongLinkLink
//
//  Created by James Kong on 8/17/13.
//
//

#import "RootViewController.h"
#import "cocos2d.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Obtain the shared director in order to...
    CCDirector *director = [CCDirector sharedDirector];
    
    // Sets landscape mode
    [director setDeviceOrientation:kCCDeviceOrientationPortrait];
    
    // Turn on display FPS
    [director setDisplayFPS:NO];
    
    // Turn on multiple touches
    EAGLView *eaglView = [director openGLView];
    [eaglView setMultipleTouchEnabled:YES];
    [self.view addSubview:eaglView];
    
    static NSString * const kADBannerViewClass = @"ADBannerView";
    if (NSClassFromString(kADBannerViewClass) != nil) {
        
        self.bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
        [self.bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
                                                            ADBannerContentSizeIdentifier320x50,
                                                            ADBannerContentSizeIdentifier480x32, nil]];
        
        self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
        
        [self.bannerView setDelegate:self];
        
        [self.view addSubview:self.bannerView];
        [self moveBannerOffScreen];
        
    }
    
    [CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];
    
    [[CCDirector sharedDirector] runWithScene: [HelloWorld scene]];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
