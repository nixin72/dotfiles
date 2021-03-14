import XMonad
import XMonad.Util.EZConfig ( additionalKeysP )
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Hooks.EwmhDesktops

keybindings :: [([Char], X ())]
keybindings =
  [-- Hotkeys to open applications
   ("M4-<Return>", spawn "alacritty"),
   ("M4-d", spawn "discord"),
   ("M4-r", spawn "rofi -show drun -show-icons"),
   ("M4-w", spawn "firefox"),
   ("M4-b", spawn "firefox"),
   ("M4-s", spawn "spectacle"),
   ("M4-h", spawn "alacritty -e htop"),
   ("M4-w", spawn "teams"),
   ("M4-b", spawn "steam"),
   ("M4-x", spawn "xmonad --restart"),
   ("M4-m", spawn "spotify"),
   ("M4-c", spawn "emacs"),
   ("M4-v", spawn "nvim"),

   ("M-<Return>", spawn "alacritty"),
   ("M-d", spawn "rofi -show drun -show-icons"),
   ("M-S-/", spawn "/s/repos/dotfiles/scripts/toggle-sidebar.clj"),
   ("M-<Tab>", spawn "rofi -show window -show-icons")]


main :: IO ()
main = do
  xmonad $ ewmh def {
    handleEventHook = handleEventHook def <+> fullscreenEventHook,
    layoutHook = gaps [(U,42)] $ Tall 1 (10/100) (1/2) ||| Full,
    terminal = "alacritty",
    focusedBorderColor = "#DFDFDF",
    normalBorderColor  = "#21252B"
    } `additionalKeysP` keybindings



