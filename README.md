# Milan High Fidelity - React + Mock JSON Server

This project recreates the Milan UI flows using **React**, **Tailwind CSS**, reusable components, and a **json-server** backend for mock API integration.

## Stack
- React + Vite
- Tailwind CSS (design system / styling framework)
- Axios for API calls
- json-server for mock backend
- Vitest + Testing Library

## Quick start
```bash
npm install
npm run start
```

This starts:
- Frontend: `http://localhost:5173`
- Mock API: `http://localhost:3001`

## Commands
```bash
npm run dev          # frontend only
npm run mock:server  # mock backend only
npm run build        # production build
npm run test         # unit tests
```

## API shape
- `GET /sections?_embed=screens` -> returns section objects with nested screen items.

Mock data file: `mock-server/db.json` (contains 50+ screens across onboarding, matching, chat, profile and support flows).
