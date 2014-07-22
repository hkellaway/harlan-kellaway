//
//  SocialMediaStatus.m
//  harlankellaway
//
//  Created by Harlan Kellaway on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "SocialMediaStatus.h"

static const int ACTION_TYPE_RECIRCULATE = 1;
static const int ACTION_TYPE_FAVORITE = 2;

static const float SCALE_FACTOR = 0.38;

@implementation SocialMediaStatus
{
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
        CCSprite *meterMiddle = _gameplay.meterMiddle;
        CCSprite *meterTop = _gameplay.meterTop;
        
        // TODO: calculate scale factor
        CGFloat scaleFactor = 0.25;
        CGFloat meterMiddleGrowth = meterMiddle.contentSize.height * scaleFactor;
        
        meterMiddle.scaleY = meterMiddle.scaleY + scaleFactor;
        
        meterTop.position = ccp(meterTop.position.x, meterTop.position.y + meterMiddleGrowth);
    }
    
    [self disable];
}

- (void)favorite
{
    CCLOG(@"Favorite button pressed");
    
    if(_actionType == ACTION_TYPE_FAVORITE)
    {
        CCSprite *meterMiddle = _gameplay.meterMiddle;
        CCSprite *meterTop = _gameplay.meterTop;
        
        // TODO: calculate scale factor
        CGFloat scaleFactor = 0.25;
        CGFloat meterMiddleGrowth = meterMiddle.contentSize.height * scaleFactor;
        
        meterMiddle.scaleY = meterMiddle.scaleY + scaleFactor;
        
        meterTop.position = ccp(meterTop.position.x, meterTop.position.y + meterMiddleGrowth);
    }
    
    [self disable];
}

# pragma mark - instance methods

- (void)refresh
{
    int numStatuses = _gameplay.numStatuses;
    int spacing = _gameplay.statusSpacing;
    int newY = numStatuses * ((self.contentSize.height * self.scaleY) + spacing) - self.contentSize.height * self.scaleY/2;
    
    self.position = ccp(self.position.x, newY);
    self.isAtScreenBottom = FALSE;
    [self enable];
}

#pragma mark - helper methods

- (void)disable
{
    _recirculateButton.enabled = FALSE;
    _favoriteButton.enabled = FALSE;
}

- (void)enable
{
    _recirculateButton.enabled = TRUE;
    _favoriteButton.enabled = TRUE;
}

@end
