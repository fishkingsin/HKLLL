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
	
	CCLabelTTF *label = [CCLabelTTF labelWithString:@"Link" fontName:@"Marker Felt" fontSize:48];
	label.position =  ccp( size.width /2 , size.height/2 );
	[self addChild: label];
	
	CCSprite *button;
	button = [CCSprite spriteWithFile:@"play.png"];
	button.position = ccp(size.width/2, size.height/2 - 80);
	[self addChild:button];
	
	self.isTouchEnabled = YES;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self scheduleOnce:@selector(makeTransition:) delay:0];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameCoreLayer scene] withColor:ccWHITE]];
}

@end
