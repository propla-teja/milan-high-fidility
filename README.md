# Milan High Fidelity Flutter Demo

Flutter implementation of the uploaded Milan screen set using reusable UI components and mock JSON data integration.

## Stack
- Flutter (Material 3 theming as the UI framework/style system)
- Reusable widgets for buttons, user tiles, and status cards
- Mock API via `json-server` + local asset fallback for offline runs

## Run with local mock JSON server
```bash
npm install -g json-server
json-server --watch mock_server/db.json --port 3000
```

## Run app
```bash
flutter pub get
flutter run
```

If the mock server is not running, app automatically falls back to `assets/mock/*.json`.

## Covered flows from the provided mockups
- Onboarding, OTP, OTP Expired, verification states
- Daily matches and premium lock behavior
- Block/report/safety moderation flows
