/*
    ---> Notch - Mobile Extension
 
    ---> Author: Irlan Bragi
    ---> Organization: Bragi Estúdios
    ---> Creation date: March 2019
    ---> Contact: team@bragiestudios.com
 
    ---> Copyright © 2019 Bragi Estúdios. All rights reserved. https://bragiestudios.com
*/

@interface NOTCH : NSObject
{
}

-(double)NOTCH_is;

-(double)NOTCH_getSafeInsetBottom;
-(double)NOTCH_getSafeInsetLeft;
-(double)NOTCH_getSafeInsetRight;
-(double)NOTCH_getSafeInsetTop;

-(double)NOTCH_getBottom:(double)_display_orientation Arg2:(NSString*)_deviceSimulator;
-(double)NOTCH_getLeft:(double)_display_orientation Arg2:(NSString*)_deviceSimulator;
-(double)NOTCH_getRight:(double)_display_orientation Arg2:(NSString*)_deviceSimulator;
-(double)NOTCH_getTop:(double)_display_orientation Arg2:(NSString*)_deviceSimulator;


@end
