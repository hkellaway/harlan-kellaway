//
//  SocialMediaStatus.m
//  harlankellaway
//
//  Created by Harlan Kellaway on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "SocialMediaStatus.h"

static const  int ACTION_TYPE_RECIRCULATE = 1;
static const int ACTION_TYPE_FAVORITE = 2;

static const float SCALE_FACTOR = 0.38;

@implementation SocialMediaStatus
{
    CCSprite *_avatar;
    CCButton *_recirculateButton;
    CCButton *_favoriteButton;
    CCButton *_blockButton;
}

# pragma mark - initializers

- (void)didLoadFromCCB
{
    self.scaleX = self.scaleX * SCALE_FACTOR;
    self.scaleY = self.scaleY * SCALE_FACTOR;
}

# pragma mark - button actions

// TODO: Do not duplicate button pressing functionality with each button press function

- (void)recirculate
{
    CCLOG(@"Recirculate button pressed");
    
    if(_actionType == ACTION_TYPE_RECIRCULATE)
    {
        CCLOG(@"Yay!");
        
        CCSprite *meterMiddle = _gameplay.meterMiddle;
        CCSprite *meterTop = _gameplay.meterTop;
        
        meterMiddle.scaleY = meterMiddle.scaleY + 1;
        meterTop.position = ccp(meterTop.position.x, meterTop.position.y + 1);
        
        

        
        CCLOG(@"Scaling attempt complete");
    }
}

- (void)favorite
{
    CCLOG(@"Favorite button pressed");
    
    if(_actionType == ACTION_TYPE_FAVORITE)
    {
        CCLOG(@"Yay!");
    }
}

@end
