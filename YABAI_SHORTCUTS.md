# Yabai + skhd Keyboard Shortcuts

Hyprland-inspired window management for macOS.

**Main Modifier:** `Cmd + Alt` (like Super in Hyprland)

## Window Focus (Vim-style)

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + H` | Focus window to the left |
| `Cmd + Alt + J` | Focus window below |
| `Cmd + Alt + K` | Focus window above |
| `Cmd + Alt + L` | Focus window to the right |

## Move Windows

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + Shift + H` | Swap window left |
| `Cmd + Alt + Shift + J` | Swap window down |
| `Cmd + Alt + Shift + K` | Swap window up |
| `Cmd + Alt + Shift + L` | Swap window right |
| `Cmd + Alt + Ctrl + H/J/K/L` | Warp window (move to position) |

## Resize Windows

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + Shift + Ctrl + H` | Resize window left |
| `Cmd + Alt + Shift + Ctrl + J` | Resize window down |
| `Cmd + Alt + Shift + Ctrl + K` | Resize window up |
| `Cmd + Alt + Shift + Ctrl + L` | Resize window right |
| `Cmd + Alt + E` | Balance all windows (equal size) |

## Window Layout

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + F` | Toggle float (center window) |
| `Cmd + Alt + M` | Toggle fullscreen (yabai) |
| `Cmd + Alt + Shift + M` | Toggle native macOS fullscreen |
| `Cmd + Alt + S` | Toggle split direction (horizontal/vertical) |
| `Cmd + Alt + R` | Rotate tree 90 degrees |
| `Cmd + Alt + Y` | Flip along Y-axis (mirror horizontal) |
| `Cmd + Alt + X` | Flip along X-axis (mirror vertical) |
| `Cmd + Alt + T` | Toggle layout: BSP ↔ Stack |
| `Cmd + Alt + Space` | Toggle layout: BSP ↔ Float |

## Workspaces (Spaces)

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + 1-9` | Focus workspace 1-9 |
| `Cmd + Alt + Shift + 1-9` | Move window to workspace 1-9 |
| `Cmd + Alt + Left/Right` | Focus previous/next workspace |
| `Cmd + Alt + Shift + Left/Right` | Move window to prev/next workspace and follow |

## Multi-Monitor

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + Ctrl + 1-3` | Focus display 1-3 |
| `Cmd + Alt + Ctrl + Shift + 1-3` | Move window to display and follow |

## Quick Launch

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + Return` | Launch WezTerm |
| `Cmd + Alt + B` | Launch Browser |
| `Cmd + Alt + C` | Launch VS Code |

## Yabai Control

| Shortcut | Action |
|----------|--------|
| `Cmd + Alt + Shift + R` | Restart yabai |
| `Cmd + Alt + Shift + Q` | Stop yabai |
| `Cmd + Alt + Shift + S` | Start yabai |

## Layout Modes

- **BSP (Binary Space Partitioning)**: Default tiling mode, windows split space recursively
- **Stack**: All windows stacked (like tabs), only one visible at a time
- **Float**: Windows float freely (no tiling)

## Tips

1. **Create new spaces**: System Settings → Desktop & Dock → Mission Control → Hot Corners
2. **Or use:** Swipe up with 3-4 fingers, click "+" in top right
3. **Mouse + Cmd**: Drag windows around or resize while holding Cmd
4. **Focus follows mouse**: Disabled by default (edit ~/.yabairc to enable)

## Rectangle (Fallback)

Rectangle is installed as backup for simple window snapping:
- `Ctrl + Alt + Left/Right/Up/Down`: Snap to half/quarter screen
- `Ctrl + Alt + F`: Maximize window
- Access Rectangle from menu bar for more options
