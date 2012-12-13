//
//  Ball.m
//  Dec6
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "Ball.h"

@implementation Ball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];// Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef c = UIGraphicsGetCurrentContext();
	CGContextBeginPath(c);
	CGContextAddEllipseInRect(c,rect);
	CGContextSetRGBFillColor(c, 1, 1, 1, 1);	//white, opaque
	CGContextFillPath(c);
}

@end
