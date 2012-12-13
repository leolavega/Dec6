//
//  View.h
//  Dec6
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Ball;

@interface View : UIView{
	UIViewController* controller;
	CGFloat defaultGravity;
	CGFloat gx;
	CGFloat gy;
	CGFloat vx;
	CGFloat vy;
	CGFloat kx;
	CGFloat ky;
	CGFloat prevX;
	CGFloat prevY;
	int prevOrientation;
	CGFloat radius;
	Ball* ball;
}

- (id) initWithFrame:(CGRect)frame withController:(UIViewController*) c;

@end
