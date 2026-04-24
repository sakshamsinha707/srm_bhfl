# Frontend

React + Vite frontend for the SRM hierarchy challenge.

## Scripts

```bash
npm run dev
npm run build
npm run lint
npm run preview
```

## Environment Variable

Copy `.env.example` to `.env` and set:

```bash
VITE_API_BASE_URL=http://localhost:8080
```

Point this at your deployed backend URL before publishing the frontend.

## Features

- Supports newline-separated, comma-separated, and JSON-array inputs
- Calls `POST /bfhl`
- Displays identity metadata, summary metrics, hierarchy cards, invalid entries, and duplicate edges
- Shows a clear error banner when the API request fails
