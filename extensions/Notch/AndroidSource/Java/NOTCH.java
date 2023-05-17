/*
    ---> Notch - Mobile Extension
 
    ---> Author: Irlan Bragi
    ---> Organization: Bragi Estúdios
    ---> Creation date: March 2019
    ---> Contact: team@bragiestudios.com
 
    ---> Copyright © 2019 Bragi Estúdios. All rights reserved. https://bragiestudios.com
*/

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.R;

import android.app.Activity;
import android.util.Log;
import android.os.Build;

import android.view.View;
import android.view.WindowManager;
import android.view.DisplayCutout;

import android.graphics.Rect;
import java.util.List;



public class NOTCH
{

    private static final int EVENT_OTHER_SOCIAL = 70;
    Activity myActivity=RunnerActivity.CurrentActivity;

    //-------> Init
        
        public void Init()
        {
            Log.i("yoyo", "NOTCH: Call NOTCH_Init()");

            

            
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P)){
                
                myActivity.getWindow().getAttributes().layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
                    /*
                        Para add StatusBar:
                        myActivity.getWindow().getAttributes().flags = WindowManager.LayoutParams.FLAG_FORCE_NOT_FULLSCREEN;
                    */
            }
            
            Log.i("yoyo", "NOTCH: finish NOTCH_Init()");
            
        }
        
    //<------- Init
        
    
        
    //-------> NOTCH_is
        
        public double NOTCH_is()
        {
            
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ){
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                if (_parcial_DisplayCutout!=null) {return 1;} else {return 0;}
            }
             else {return 0;}
        }
        
    //<------- NOTCH_is
    

    
    //-------> NOTCH_getBottom
        
        public double NOTCH_getBottom(double _DisplayOri, String _diOS)
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                List<Rect> _parcial_List_Rect = _parcial_DisplayCutout.getBoundingRects();
                Rect _parcial_Rect = _parcial_List_Rect.get(0);
                
                return _parcial_Rect.bottom;
            }
            return 0;
        }
        
    //<------- NOTCH_getBottom
    
    //-------> NOTCH_getLeft
        
        public double NOTCH_getLeft(double _DisplayOri, String _diOS)
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                List<Rect> _parcial_List_Rect = _parcial_DisplayCutout.getBoundingRects();
                Rect _parcial_Rect = _parcial_List_Rect.get(0);
                
                return _parcial_Rect.left;
            }
            return 0;
        }
        
    //<------- NOTCH_getLeft
    
    //-------> NOTCH_getRight
        
        public double NOTCH_getRight(double _DisplayOri, String _diOS)
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                List<Rect> _parcial_List_Rect = _parcial_DisplayCutout.getBoundingRects();
                Rect _parcial_Rect = _parcial_List_Rect.get(0);
                
                return _parcial_Rect.right;
            }
            return 0;
        }
        
    //<------- NOTCH_getRight
    
    //-------> NOTCH_getTop
        
        public double NOTCH_getTop(double _DisplayOri, String _diOS)
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                List<Rect> _parcial_List_Rect = _parcial_DisplayCutout.getBoundingRects();
                Rect _parcial_Rect = _parcial_List_Rect.get(0);
                
                return _parcial_Rect.top;
            }
            return 0;
        }
        
    //<------- NOTCH_getTop




    //-------> NOTCH_getSafeInsetBottom
        
        public double NOTCH_getSafeInsetBottom()
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                return _parcial_DisplayCutout.getSafeInsetBottom();
            }
            return 0;
        }
        
    //<------- NOTCH_getSafeInsetBottom
        
    //-------> NOTCH_getSafeInsetLeft
            
        public double NOTCH_getSafeInsetLeft()
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                return _parcial_DisplayCutout.getSafeInsetLeft();
            }
            return 0;
        }
            
    //<------- NOTCH_getSafeInsetLeft
        
    //-------> NOTCH_getSafeInsetRight
        
        public double NOTCH_getSafeInsetRight()
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                return _parcial_DisplayCutout.getSafeInsetRight();
            }
            return 0;
        }
        
    //<------- NOTCH_getSafeInsetRight
    
    //-------> NOTCH_getSafeInsetTop
        
        public double NOTCH_getSafeInsetTop()
        {
            if ( (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ) && (NOTCH_is()==1)){
                
                DisplayCutout _parcial_DisplayCutout = myActivity.getWindow().getDecorView().getRootWindowInsets().getDisplayCutout();
                return _parcial_DisplayCutout.getSafeInsetTop();
            }
            return 0;
        }
        
    //<------- NOTCH_getSafeInsetTop
    
} // End of class
