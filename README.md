# Golf Round Tracker (Garmin Connect IQ)

A free lightweight Garmin Connect IQ **Device App** for tracking golf rounds on watches that do not natively support Garmin’s Golf activity.

## Features

- Start / Pause / End a round
- Hole-by-hole stroke entry

No course maps. No subscriptions. Just simple, reliable round tracking.

## Screen Flow

```
CourseSelect → HoleSelect → Tracker → End
```

| Screen | Description |
|---|---|
| **CourseSelect** | Pick a course from the list or choose Free Play |
| **HoleSelect** | Choose 9 or 18 holes |
| **Tracker** | Track strokes hole by hole |
| **End** | Round summary — total strokes and score vs par |

## Supported Devices

This is a Connect IQ **Device App** and will run on Garmin watches that:

- Support Connect IQ
- Have GPS
- Meet the minimum API level defined in `manifest.xml`

Initial development target:

- Forerunner 255 & 265 series

Additional devices can be added after testing.

## Development Setup

### Prerequisites

- [Java 11+]
- [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/) (install via SDK Manager)
- [VS Code](https://code.visualstudio.com) with the [Monkey C extension](https://marketplace.visualstudio.com/items?itemName=garmin.monkey-c)
- [uv](https://docs.astral.sh/uv/getting-started/installation/) (Python package manager, for course data scripts)

For full Garmin SDK setup instructions, see the [Connect IQ Getting Started Guide](https://developer.garmin.com/connect-iq/connect-iq-basics/getting-started/).

### Watch App

1. Clone the repo and open it in VS Code
2. The Monkey C extension will detect `monkey.jungle` automatically
3. Press `Cmd+Shift+P` → **Monkey C: Build and Run** to launch in the simulator
4. Select your target device when prompted (Forerunner 255 or 265)

A `developer_key` is required to sign builds. Generate one via `Cmd+Shift+P` → **Monkey C: Generate Developer Key** and place it in the project root. It is gitignored and must be created locally.

### Course Data Scripts

The scripts in `source/` fetch course data from the [Golf Course API](https://golfcourseapi.com) and generate Monkey C source code from the results.

1. Copy `.env.example` to `.env` and add your API key:
   ```bash
   cp .env.example .env
   ```

2. Install dependencies with uv:
   ```bash
   uv sync
   ```

3. Fetch course data (writes `courses.json`):
   ```bash
   uv run source/courses.py
   ```

4. Generate Monkey C source from the fetched data (writes `source/courseData.mc`):
   ```bash
   uv run source/course_data.py
   ```

### Planned Features
- Total score calculation
- Manual shot tagging
- GPS distance recording
- Local on-device storage of rounds
- Round history browser
- Optional FIT custom-field export
