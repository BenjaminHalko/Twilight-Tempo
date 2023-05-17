/*
    ---> Notch - Mobile Extension
 
    ---> Author: Irlan Bragi
    ---> Organization: Bragi Estúdios
    ---> Creation date: March 2019
    ---> Contact: team@bragiestudios.com
 
    ---> Copyright © 2019 Bragi Estúdios. All rights reserved. https://bragiestudios.com
*/

#import <Foundation/Foundation.h>
#import <sys/utsname.h>
#import <UIKit/UIKit.h>
#import "NOTCH.h"

@implementation NOTCH
{
}


//-------> NOTCH_is
    
    -(double)NOTCH_is
    {
        
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            
            double SafeInsetTop = window.safeAreaInsets.top;
            double SafeInsetBottom = window.safeAreaInsets.bottom;
            double SafeInsetLeft = window.safeAreaInsets.left;
            double SafeInsetRight = window.safeAreaInsets.right;
            
            if (SafeInsetTop==0 && SafeInsetBottom==0  && SafeInsetLeft==0  && SafeInsetRight==0) {return 0;} else {return 1;}
        }
         else {return 0;}
    }
    
//<------- NOTCH_i

//-------> NOTCH_getSafeInsetBottom
    
    -(double)NOTCH_getSafeInsetBottom
    {
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double SafeInsetBottom = window.safeAreaInsets.bottom * snScale;
            
            return SafeInsetBottom;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getSafeInsetBottom

//-------> NOTCH_getSafeInsetLeft
    
    -(double)NOTCH_getSafeInsetLeft
    {
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double SafeInsetLeft = window.safeAreaInsets.left * snScale;
            
            return SafeInsetLeft;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getSafeInsetLeft

//-------> NOTCH_getSafeInsetLeft
    
    -(double)NOTCH_getSafeInsetRight
    {
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double SafeInsetRight = window.safeAreaInsets.right * snScale;
            
            return SafeInsetRight;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getSafeInsetRight

//-------> NOTCH_getSafeInsetTop
    
    -(double)NOTCH_getSafeInsetTop
    {
        if (@available(iOS 11.0, *)) {
            UIWindow *window = UIApplication.sharedApplication.keyWindow;
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double SafeInsetTop = window.safeAreaInsets.top * snScale;
            
            return SafeInsetTop;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getSafeInsetTop


//-------> NOTCH_getBottom
    
-(double)NOTCH_getBottom:(double)_display_orientation Arg2:(NSString*)_deviceSimulator
    {
        if (@available(iOS 11.0, *)) {
            
            double display_landscape= 0;
            double display_landscape_flipped= 2;
            double display_portrait= 1;
            double display_portrait_flipped= 3;
            double _Points_ = 0;
            
            struct utsname systemInfo;
            uname(&systemInfo);

            NSString * deviceName = [NSString stringWithCString:systemInfo.machine
            encoding:NSUTF8StringEncoding];
            
            if ([deviceName isEqualToString:@"x86_64"]
            or  [deviceName isEqualToString:@"i386"]
            or  [deviceName isEqualToString:@"arm64"])
            {
                deviceName=_deviceSimulator;
                NSLog(@"Device is a simulator. Simulate notch of %@",deviceName);
            }
            
            
                 if ([deviceName isEqualToString:@"iPhone10,3"] //iPhone X (CDMA)
                 or  [deviceName isEqualToString:@"iPhone10,6"] //iPhone X (GSM)
                 or  [deviceName isEqualToString:@"iPhone11,2"] //iPhone Xs
                 or  [deviceName isEqualToString:@"iPhone12,3"])//iPhone 11 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 292;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 292;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 30;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 812;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,8"] //iPhone XR
                 or  [deviceName isEqualToString:@"iPhone12,1"])//iPhone 11
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 322;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 322;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 33;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 896;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,4"] //iPhone XS Max
                 or  [deviceName isEqualToString:@"iPhone11,6"] //iPhone XS Max China
                 or  [deviceName isEqualToString:@"iPhone12,5"])//iPhone 11 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 312;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 312;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 30;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 896;}
                 }
            else if ([deviceName isEqualToString:@"iPhone13,1"]) //iPhone 12 Mini
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 375-74;} //w_new - largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 375-74;} //w_new - largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 35;}      //Altura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 812;}     //h_new
                 }
            else if ([deviceName isEqualToString:@"iPhone13,2"] //iPhone 12
                 or  [deviceName isEqualToString:@"iPhone13,3"])//iPhone 12 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 390-88;} //w_new - largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 390-88;} //w_new - largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 32;}      //Altura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 844;}     //h_new
                 }
            else if ([deviceName isEqualToString:@"iPhone13,4"]) //iPhone 12 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 428-108;} //w_new - largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 428-108;} //w_new - largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 32;}      //Altura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 926;}     //h_new
                 }
            
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double NOTCHTop = _Points_ * snScale;
            
            return NOTCHTop;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getBottom

//-------> NOTCH_getLeft
    
    -(double)NOTCH_getLeft:(double)_display_orientation Arg2:(NSString*)_deviceSimulator
    {
        if (@available(iOS 11.0, *)) {
            
            double display_landscape= 0;
            double display_landscape_flipped= 2;
            double display_portrait= 1;
            double display_portrait_flipped= 3;
            double _Points_ = 0;
            
            struct utsname systemInfo;
            uname(&systemInfo);

            NSString * deviceName = [NSString stringWithCString:systemInfo.machine
            encoding:NSUTF8StringEncoding];
            
            if ([deviceName isEqualToString:@"x86_64"]
            or  [deviceName isEqualToString:@"i386"]
            or  [deviceName isEqualToString:@"arm64"])
            {
                deviceName=_deviceSimulator;
                NSLog(@"Device is a simulator. Simulate notch of %@",deviceName);
            }
            
            
                 if ([deviceName isEqualToString:@"iPhone10,3"] //iPhone X (CDMA)
                 or  [deviceName isEqualToString:@"iPhone10,6"] //iPhone X (GSM)
                 or  [deviceName isEqualToString:@"iPhone11,2"] //iPhone Xs
                 or  [deviceName isEqualToString:@"iPhone12,3"])//iPhone 11 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 782;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 83;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 83;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,8"] //iPhone XR
                 or  [deviceName isEqualToString:@"iPhone12,1"])//iPhone 11
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 863;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 92;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 92;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,4"] //iPhone XS Max
                 or  [deviceName isEqualToString:@"iPhone11,6"] //iPhone XS Max China
                 or  [deviceName isEqualToString:@"iPhone12,5"])//iPhone 11 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 866;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 102;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 102;}
                 }
            else if ([deviceName isEqualToString:@"iPhone13,1"]) //iPhone 12 Mini
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 812-35;} //h_new - altura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}  //0
                     if (_display_orientation==display_portrait         ) {_Points_ = 74;} //largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 74;} //largura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,2"] //iPhone 12
                 or  [deviceName isEqualToString:@"iPhone13,3"])//iPhone 12 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 844-32;} //h_new - altura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}  //0
                     if (_display_orientation==display_portrait         ) {_Points_ = 88;} //largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 88;} //largura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,4"]) //iPhone 12 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 926-32;} //h_new - altura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 0;}  //0
                     if (_display_orientation==display_portrait         ) {_Points_ = 108;} //largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 108;} //largura
                 }
            
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double NOTCHLeft = _Points_ * snScale;
            
            return NOTCHLeft;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getLeft

//-------> NOTCH_getLeft
    
    -(double)NOTCH_getRight:(double)_display_orientation Arg2:(NSString*)_deviceSimulator
    {
        if (@available(iOS 11.0, *)) {
            
            double display_landscape= 0;
            double display_landscape_flipped= 2;
            double display_portrait= 1;
            double display_portrait_flipped= 3;
            double _Points_ = 0;
            
            struct utsname systemInfo;
            uname(&systemInfo);

            NSString * deviceName = [NSString stringWithCString:systemInfo.machine
            encoding:NSUTF8StringEncoding];
            
            if ([deviceName isEqualToString:@"x86_64"]
            or  [deviceName isEqualToString:@"i386"]
            or  [deviceName isEqualToString:@"arm64"])
            {
                deviceName=_deviceSimulator;
                NSLog(@"Device is a simulator. Simulate notch of %@",deviceName);
            }
            
            
                 if ([deviceName isEqualToString:@"iPhone10,3"] //iPhone X (CDMA)
                 or  [deviceName isEqualToString:@"iPhone10,6"] //iPhone X (GSM)
                 or  [deviceName isEqualToString:@"iPhone11,2"] //iPhone Xs
                 or  [deviceName isEqualToString:@"iPhone12,3"])//iPhone 11 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 812;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 30;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 292;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 292;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,8"] //iPhone XR
                 or  [deviceName isEqualToString:@"iPhone12,1"])//iPhone 11
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 896;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 33;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 322;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 322;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,4"] //iPhone XS Max
                 or  [deviceName isEqualToString:@"iPhone11,6"] //iPhone XS Max China
                 or  [deviceName isEqualToString:@"iPhone12,5"])//iPhone 11 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 896;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 30;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 312;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 312;}
                 }
            else if ([deviceName isEqualToString:@"iPhone13,1"]) //iPhone 12 Mini
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 812;} //h_new
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 35;}  //Altura
                     if (_display_orientation==display_portrait         ) {_Points_ = 375-74;} //w_new-largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 375-74;} //w_new-largura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,2"] //iPhone 12
                 or  [deviceName isEqualToString:@"iPhone13,3"])//iPhone 12 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 844;} //h_new
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 32;}  //Altura
                     if (_display_orientation==display_portrait         ) {_Points_ = 390-88;} //w_new-largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 390-88;} //w_new-largura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,4"]) //iPhone 12 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 926;} //h_new
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 32;}  //Altura
                     if (_display_orientation==display_portrait         ) {_Points_ = 428-108;} //w_new-largura
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 428-108;} //w_new-largura
                 }
            
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double NOTCHRight = _Points_ * snScale;
            
            return NOTCHRight;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getRight

//-------> NOTCH_getTop
    
    -(double)NOTCH_getTop:(double)_display_orientation Arg2:(NSString*)_deviceSimulator
    {
        if (@available(iOS 11.0, *)) {
            
            double display_landscape= 0;
            double display_landscape_flipped= 2;
            double display_portrait= 1;
            double display_portrait_flipped= 3;
            double _Points_ = 0;
            
            struct utsname systemInfo;
            uname(&systemInfo);

            NSString * deviceName = [NSString stringWithCString:systemInfo.machine
            encoding:NSUTF8StringEncoding];
            
            if ([deviceName isEqualToString:@"x86_64"]
            or  [deviceName isEqualToString:@"i386"]
            or  [deviceName isEqualToString:@"arm64"])
            {
                deviceName=_deviceSimulator;
                NSLog(@"Device is a simulator. Simulate notch of %@",deviceName);
            }
            
            
                 if ([deviceName isEqualToString:@"iPhone10,3"] //iPhone X (CDMA)
                 or  [deviceName isEqualToString:@"iPhone10,6"] //iPhone X (GSM)
                 or  [deviceName isEqualToString:@"iPhone11,2"] //iPhone Xs
                 or  [deviceName isEqualToString:@"iPhone12,3"])//iPhone 11 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 83;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 83;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 782;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,8"] //iPhone XR
                 or  [deviceName isEqualToString:@"iPhone12,1"])//iPhone 11
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 92;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 92;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 863;}
                 }
            else if ([deviceName isEqualToString:@"iPhone11,4"] //iPhone XS Max
                 or  [deviceName isEqualToString:@"iPhone11,6"] //iPhone XS Max China
                 or  [deviceName isEqualToString:@"iPhone12,5"])//iPhone 11 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 102;}
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 102;}
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 866;}
                 }
            else if ([deviceName isEqualToString:@"iPhone13,1"]) //iPhone 12 Mini
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 74;} //Largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 74;} //Largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}   //0
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 812-35;} //h_new-Altura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,2"] //iPhone 12
                 or  [deviceName isEqualToString:@"iPhone13,3"])//iPhone 12 Pro
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 88;} //Largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 88;} //Largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}   //0
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 844-32;} //h_new-Altura
                 }
            else if ([deviceName isEqualToString:@"iPhone13,4"]) //iPhone 12 Pro Max
                 {
                     if (_display_orientation==display_landscape        ) {_Points_ = 108;} //Largura
                     if (_display_orientation==display_landscape_flipped) {_Points_ = 108;} //Largura
                     if (_display_orientation==display_portrait         ) {_Points_ = 0;}   //0
                     if (_display_orientation==display_portrait_flipped ) {_Points_ = 926-32;} //h_new-Altura
                 }
            
            CGFloat snScale = [[UIScreen mainScreen] nativeScale];
            double NOTCHTop = _Points_ * snScale;
            
            return NOTCHTop;
        }
         else {return 0;}
    }
    
//<------- NOTCH_getTop


@end





