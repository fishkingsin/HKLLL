//
//  GameCoreLayer.h
//  Hong Kong LinkLink
//
//  Created by James Kong on 13-08-15
//  Copyright fishkingsin.com 2013. All rights reserved.
//

#import "cocos2d.h"

@interface GameCoreLayer : CCLayer
{
	CGPoint prePoint;
	NSInteger countCleared;
	NSMutableArray *arrayMap;
	NSInteger counter;
}

+(CCScene *) scene;

@end


@interface MapNode : NSObject

@property (readwrite, nonatomic) NSInteger order;
@property (readwrite, nonatomic) NSInteger imgid;

@end
