//
//  InboxWebView.m
//  Inbox
//
//  Created by Alan Westbrook on 3/19/15.
//  Copyright (c) 2015 Marcelo Marfil & Alan Westbrook. All rights reserved.
//

#import "InboxWebView.h"


// All this because setting the user agent is so vary busted any other way
@interface WKWebView (cheat)
- (void)_setCustomUserAgent:(NSString*)agent;

@end

@implementation InboxWebView

- (void)setAgent:(NSString *)agent {
    id cheat = self;
    [cheat _setCustomUserAgent:agent];
}

@end
