//
//  IntroLayer.m
//  Hong Kong LinkLink
//
//  Created by James Kong on 13-08-15
//  Copyright fishkingsin.com 2013. All rights reserved.
//

#import "IntroLayer.h"
#import "GameCoreLayer.h"

#pragma mark - IntroLayer

@implementation IntroLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	IntroLayer *layer = [IntroLayer node];
	[scene addChild: layer];
	return scene;
}

-(void) onEnter
{
	[super onEnter];

	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	background = [CCSprite spriteWithFile:@"bg.png"];	background.position = ccp(size.width/2, size.height/2);
	[self addChild: background];
	
	CCLabelTTF *label = nil;
    int ran = (int)(CCRANDOM_0_1() * 5);
    switch(ran)
    {
        case 0:
            label = [CCLabelTTF labelWithString:@"西" fontName:@"Helvetica" fontSize:48];
            break;
        case 1:
            label = [CCLabelTTF labelWithString:@"小" fontName:@"Helvetica" fontSize:48];
            break;
        case 2:
            label = [CCLabelTTF labelWithString:@"能" fontName:@"Helvetica" fontSize:48];
            break;
        case 3:
            label = [CCLabelTTF labelWithString:@"七" fontName:@"Helvetica" fontSize:48];
            break;
        case 4:
            label = [CCLabelTTF labelWithString:@"九" fontName:@"Helvetica" fontSize:48];
            break;
            
    }
	label.position =  ccp( size.width /2 , size.height/2 );
	[self addChild: label];
	
    label = [CCLabelTTF labelWithString:@"開始" fontName:@"AmericanTypewriter-CondensedBold" fontSize:24];
//    label.position =  ccp( size.width /2 , (size.height/2)-50 );
//	[self addChild: label];
    
//	CCSprite *button;
//	button = [CCSprite spriteWithFile:@"play.png"];
//	button.position = ccp(size.width/2, size.height/2 - 80);
//	[self addChild:button];
    
    // Standard method to create a button
    
    CCMenuItem *starMenuItem = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(starButtonTapped:)];
    
//    CCMenuItem *starMenuItem = [CCMenuItemImage
//                                itemFromNormalImage:@"play.png" selectedImage:@"play.png"
//                                target:self selector:@selector(starButtonTapped:)];
    starMenuItem.position = ccp(size.width/2, size.height/2 - 80);
    CCMenu *starMenu = [CCMenu menuWithItems:starMenuItem, nil];
    starMenu.position = CGPointZero;
    [self addChild:starMenu];
	
	self.isTouchEnabled = YES;
}
- (void)starButtonTapped:(id)sender {
    [self scheduleOnce:@selector(makeTransition:) delay:0];
}
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameCoreLayer scene] withColor:ccWHITE]];
}

@end
