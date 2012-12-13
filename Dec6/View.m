//
//  View.m
//  Dec6
//
//  Created by Leonardo Lavega on 12/12/12.
//  Copyright (c) 2012 Leonardo Lavega. All rights reserved.
//

#import "View.h"
#import "Ball.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withController:(UIViewController*) c{
	self = [super initWithFrame:frame];
	if(self){
		controller = c;
		defaultGravity = 0.3;
		gx = 0.0;
		gy = defaultGravity;
		vx = vy = 0;
		kx = 0.8;
		ky = 0.8;
		prevOrientation = 1;
		radius = 20;
		ball = [[Ball alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - 20, 40, 2*radius, 2*radius)];
		[self addSubview:ball];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	
	UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
	if(prevOrientation != deviceOrientation){
		
		//this switch statement will update the gravity (gx and gy) according to the each
		//specific change from the previous orientation to the new one
		switch(deviceOrientation){//controller.interfaceOrientation){
			
			case 1://portrait
				if(prevOrientation == 3){
					gy = -gx;
					gx = 0;
				}
				if(prevOrientation == 4){
					gy = gx;
					gx = 0;
				}
				prevOrientation = 1;
				break;
				
			case 2://portrait UpsideDown
				if(prevOrientation == 3){
					gy = gx;
					gx = 0;
				}
				if(prevOrientation == 4){
					gy = -gx;
					gx = 0;
				}

				prevOrientation = 2;
				break;
				
			case 3://Landscape Right
				if(prevOrientation == 1){
					gx = -gy;
					gy = 0;
				}
				if(prevOrientation == 2){
					gx = gy;
					gy = 0;
				}
				prevOrientation = 3;
				break;
			
			case 4://Landscape Left
				if(prevOrientation == 1){
					gx = gy;
					gy = 0;
				}
				if(prevOrientation == 2){
					gx = -gy;
					gy=0;
				}
				prevOrientation = 4;
				break;
		
			default:
				break;
		}
    }

}

-(void) move:(CADisplayLink *) displayLink {
	
	[self setNeedsDisplay];
	
	prevX = ball.center.x;
	prevY = ball.center.y;
	
	//new velocity
	vx += gx;
	vy += gy;
	
	//checking if ball will bounce out of bounds
	//bottom and top check
	if(ball.center.y + vy +radius > self.bounds.size.height || ball.center.y + vy -radius < 0){
		ball.center = CGPointMake(prevX, prevY);
		vy = -(ky)*vy;
		vx = (0.9)*vx;
	}
	
	//left and right check
	if(ball.center.x + vx - radius < 0 || ball.center.x + vx + radius > self.bounds.size.width){
		ball.center = CGPointMake(prevX, prevY);
		vx = -(kx)*vx;
		vy = (0.9)*vy;
		
	}
	
	ball.center = CGPointMake(prevX + vx, prevY + vy);
	
}

@end
