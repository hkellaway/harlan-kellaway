//
//  Inbox.m
//  harlankellaway
//
//  Created by Harlan Kellaway on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Inbox.h"
#import "Trend.h"
#import "GameState.h"

@implementation Inbox
{
    CCLabelTTF *_inboxLabel;
    CCNode *_inboxTrendsBox;
    NSMutableArray *trendsToRecirculate;
    NSMutableArray *trendsToFavorite;
}

- (void)didLoadFromCCB
{
    trendsToRecirculate = [NSMutableArray array];
    trendsToFavorite = [NSMutableArray array];
    self.visible = FALSE;
}

- (void)toggleVisibility
{
    self.visible = !self.visible;

    if(self.visible)
    {
        if(([trendsToRecirculate count] == 0) & ([trendsToFavorite count] == 0))
        {
            [self refresh];
        }
        _inboxTrendsBox.visible = TRUE;
    }
}

- (void)refresh
{
    // read Trends from shared GameState
    trendsToRecirculate = [GameState sharedInstance].trendsToRecirculate;
    trendsToFavorite = [GameState sharedInstance].trendsToFavorite;
    
    for(int j = 0; j < [trendsToFavorite count]; j++)
    {
        Trend *trend = (Trend *)[CCBReader load:@"Trend"];
        [trend runAction:[CCActionRemove action]];          // TODO: REMOVE THIS HACKY FIX FOR COCOS2D 3.1 BUG
        [trend setTrendText:[NSString stringWithFormat:@"Favorite statuses on %@", ((NSString *)trendsToFavorite[j]).lowercaseString]];
//        trend.scaleX = trend.scaleX / 2;
//        trend.scaleY = trend.scaleY / 2;
        [_inboxTrendsBox addChild:trend];
    }
    
    for(int i = 0; i < [trendsToRecirculate count]; i++)
    {
        Trend *trend = (Trend *)[CCBReader load:@"Trend"];
        [trend runAction:[CCActionRemove action]];          // TODO: REMOVE THIS HACKY FIX FOR COCOS2D 3.1 BUG
        [trend setTrendText:[NSString stringWithFormat:@"Recirculate statuses on %@", ((NSString *)trendsToRecirculate[i]).lowercaseString]];
//        trend.scaleX = trend.scaleX / 2;
//        trend.scaleY = trend.scaleY / 2;
        [_inboxTrendsBox addChild:trend];
    }
}

@end
