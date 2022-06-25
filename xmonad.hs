import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        tiled = Tall nmaster delta ratio
        threeCol = ThreeColMid nmaster delta ratio
        nmaster = 1
        ratio = 1/2
        delta = 3/100

myKeys = [ ("M-f"    , spawn "firefox")     
         ]

myConfig = def
        { modMask = mod4Mask
        , terminal = "alacritty"
        , layoutHook = myLayout
        }
        `additionalKeysP` myKeys

main :: IO ()
main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig
