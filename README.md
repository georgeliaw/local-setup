# Local Machine Setup

This repo is used to configure a fresh local desktop environment to my preferences.

Currently setup for Ubuntu 20.04.

Simply run `install.sh` and follow any prompts that come up.

NOTES:
- Below notes about Gnome are being deprecated as I'm switching to KDE
- May need to run `apt-get install --install-recommends linux-generic-hwe-20.04` on Ubuntu 20.04 to pick up all hardware enablement packages

### KDE Setup

Theming:
- Paper Icons/Cursors
- Dark/Material

Extensions:
- Event Calendar

Tilix:
- Set `Synchronize the input` to `Ctrl+Alt+Shift+S`
- Set Default profile terminal size to 215x60
- Set Default profile command to `Run command as a login shell`

Input Devices:
- Keyboard -> Advanced -> Caps Lock is disabled

Window Management:
- Task Switcher -> Visualization -> Grid

Shortcuts:
- Global Shortcuts -> Plasma:
    - Remove KDE shortcut `Manually Invoke Action on Current Clipboard` (conflicts with Tilix's `Add terminal right`)
- Global Shortcuts -> Spectacle:
    - Capture Entire Desktop: PrintScrn
    - Capture Rectangular Region: Shift+PrintScrn
- Global Shortcuts -> System Settings:
    - Konsole: None
- Global Shortcuts -> KWin:
    -> Toggle Present Windows (Current desktop) -> CapsLock/F22 (this works because we modified Xmodmap)
- Custom Shortcuts:
    - Create `Custom` group -> New -> Global Shortcut -> Command/URL
        - Trigger: Ctrl+Alt+T
        - Action: /usr/bin/tilix

Applications:
- Default Applications:
    - Terminal Emulator: tilix
    - Web Browser: Chrome

### Adding Gnome Extensions (deprecated)

This will get you some of the extensions that I prefer to use.

Open (Gnome) Tweak Tools and install the following extensions:
- Battery Status
- Dash to Dock
- Dash to Panel
- Clock override
- Applications Menu
- TopIcons Plus
- User Themes
- No Top Left Hot Corner

### Switching Caps Lock Key Behavior (deprecated)
In (Gnome) Tweak Tools, go to `Typing` > `Caps Lock key behavior` > `Make Caps Lock and additional Super`

You can also choose other behaviors if you do not wish to switch your super key to the Caps Lock key.
