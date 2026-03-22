# Claude Code Instructions — Garmin Golf Round Tracker

> **Sync note:** This is the canonical AI instructions file.
> `.github/copilot-instructions.md` contains the same content.
> If you update one, update the other.

---

## Project Overview

A native **Garmin Connect IQ watch app** written in **Monkey C** that lets golfers track a round (9 or 18 holes) on Garmin watches that do not natively support the Garmin Golf activity. It is free, lightweight, and requires no course maps or subscriptions.

**Target devices:** Forerunner 255, 255M, 255S, 255SM, 265, 265S
**Minimum API level:** Connect IQ 5.2.0
**App type:** `watch-app`

---

## Tech Stack

| Tool | Purpose |
|---|---|
| **Monkey C** (`.mc`) | Garmin's proprietary language for Connect IQ apps |
| **Garmin Connect IQ SDK** | Runtime framework (Toybox API) |
| **`monkey.jungle`** | Build descriptor — points to `manifest.xml` |
| **`manifest.xml`** | App metadata: ID, entry point, target devices, API level |
| **VS Code + Monkey C extension** | Primary development environment |

**Toybox modules in use:**
- `Toybox.Application` — app lifecycle (`AppBase`)
- `Toybox.WatchUi` — views, delegates, UI transitions
- `Toybox.Graphics` — imperative drawing to the watch display
- `Toybox.Lang` — core language types
- `Toybox.System` — system utilities

---

## Architecture

### Screen Structure (View/Delegate pattern)

Every screen is a pair:

| Screen | View file | Delegate file |
|---|---|---|
| Start (9 vs 18 holes) | `golf-round-startView.mc` | `golf-round-startDelegate.mc` |
| Hole tracking (main loop) | `golf-round-trackerView.mc` | `golf-round-trackerDelegate.mc` |
| Round summary | `golf-round-endView.mc` | `golf-round-endDelegate.mc` |

- **Views** handle rendering via `onUpdate(dc)` — draw text, bitmaps, and shapes to the `dc` (DrawingContext).
- **Delegates** handle button input (`onKey`, `onNextPage`, `onPreviousPage`) and trigger navigation.
- Navigation uses `WatchUi.switchToView()` with slide transitions — there is no navigation stack or router.

### Global State

All round state lives as module-level variables in `golf-round-trackerDelegate.mc`:

These are accessed directly across view/delegate files. There is no state management abstraction.

### App Entry Point

`golf-round-trackerApp.mc` — `golf_round_trackerApp` extends `Application.AppBase`. Its `getInitialView()` returns the start screen view/delegate pair.

## File Structure

```
garmin-golf-round-tracker/
├── manifest.xml                       # Garmin app manifest
├── monkey.jungle                      # Build config (points to manifest)
├── source/                            # App source files
├── resources/                         # App resouce dir
└── bin/                               # Build output (gitignored)
```

---

## Coding Conventions

- **Naming:** Classes use `PascalCase` (e.g., `golf_round_trackerApp`). Module-level vars and functions use `camelCase`. File names use kebab-case with `.mc` extension.
- **Class names** follow the pattern `screen_nameView` and `screen_nameDelegate`.
- Keep views focused on rendering only. Put all logic and state changes in delegates.
- The `developer_key` file is **gitignored** and must be present locally. Do not commit it.

---

## Key Constraints

- **Do not** add Node.js, npm, or web dependencies — this is a native Garmin app.
- **Do not** target devices outside the manifest's device list without updating `manifest.xml`.
- **Do not** use Connect IQ APIs below version 5.2.0.
- Keep the app lightweight — no unnecessary background processing or large assets.
