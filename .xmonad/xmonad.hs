import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig

baseConfig = desktopConfig

myNormalBorderColor  = "#261E26"
myFocusedBorderColor = "#927E7E"

main = xmonad =<< xmobar baseConfig
	{ terminal = "urxvt"
	, modMask = mod4Mask
	, normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor 
	, keys = myKeys
	}

-- Union default and new key bindings
myKeys x  = M.union (M.fromList (newKeys x)) (keys defaultConfig x)
 
-- Add new and/or redefine key bindings
newKeys conf@(XConfig {XMonad.modMask = modm}) = [
  ((<XF86KbdBrightnessUp>), spawn "kbdlight up 10%"),
  ((<XF86KbdBrightnessDown>), spawn "kbdlight down 10%")
   ]
