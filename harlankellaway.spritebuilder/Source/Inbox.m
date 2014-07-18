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
    CCNode *_trendsBox;
}

- (void)didLoadFromCCB
{
    self.visible = FALSE;
}

- (void)toggleVisibility
{
    self.visible = !self.visible;

    if(self.visible)
    {
        [self refresh];
        _trendsBox.visible = TRUE;
    }
}

- (void)refresh
{
    // read Trends from shared GameState
    NSMutableArray *trendsToRecirculate = [GameState sharedInstance].trendsToRecirculate;
    NSMutableArray *trendsToFavorite = [GameState sharedInstance].trendsToFavorite;
    
    for(int j = 0; j < [trendsToFavorite count]; j++)
    {
        Trend *trend = (Trend *)[CCBReader load:@"Trend"];
        [trend setTrendText:[NSString stringWithFormat:@"Favorite statuses on %@", ((NSString *)trendsToFavorite[j]).lowercaseString]];
        trend.scaleX = trend.scaleX / 2;
        trend.scaleY = trend.scaleY / 2;
        [_trendsBox addChild:trend];
    }
    
    
    
    for(int i = 0; i < [trendsToRecirculate count]; i++)
    {
        Trend *trend = (Trend *)[CCBReader load:@"Trend"];
        [trend setTrendText:[NSString stringWithFormat:@"Recirculate statuses on %@", ((NSString *)trendsToRecirculate[i]).lowercaseString]];
        trend.scaleX = trend.scaleX / 2;
        trend.scaleY = trend.scaleY / 2;
        [_trendsBox addChild:trend];
    }
}

@end
