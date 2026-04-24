# SRM Full Stack Challenge

Monorepo implementation of the SRM challenge with:

- `backend/`: Express API exposing `POST /bfhl`
- `frontend/`: React + Vite single-page client for submitting edge lists and viewing results

## Project Structure

```text
backend/
  src/
    bfhl.js
    bfhl.test.js
    identity.js
    server.js
frontend/
  src/
    App.jsx
    api.js
    components/
      InvalidList.jsx
      Summary.jsx
      TreeView.jsx
    styles.css
render.yaml
```

## Local Development

### Backend

```bash
cd backend
npm install
npm test
npm start
```

The API starts on `http://localhost:8080` by default.

### Frontend

```bash
cd frontend
npm install
cp .env.example .env
npm run dev
```

Set `VITE_API_BASE_URL` in `frontend/.env` to your deployed backend URL when you are not using the local API.

## API Contract

`POST /bfhl`

Request:

```json
{
  "data": ["A->B", "A->C", "B->D"]
}
```

The response includes:

- `user_id`
- `email_id`
- `college_roll_number`
- `hierarchies`
- `invalid_entries`
- `duplicate_edges`
- `summary`

## Deployment

### Backend with Docker

Build the image from the repo root:

```bash
docker build -t srm-bfhl-api .
```

Run the container:

```bash
docker run --rm -p 8080:8080 srm-bfhl-api
```

You can also pass the optional identity variables at runtime:

```bash
docker run --rm -p 8080:8080 \
  -e FULL_NAME="Saksham Sinha" \
  -e DOB_DDMMYYYY=26022004 \
  -e EMAIL_ID=ss2766@srmist.edu.in \
  -e COLLEGE_ROLL_NUMBER=RA2311004010365 \
  srm-bfhl-api
```

### Backend on Render

This repo includes `render.yaml` for the backend service. The backend also supports optional environment variables:

- `FULL_NAME`
- `DOB_DDMMYYYY`
- `EMAIL_ID`
- `COLLEGE_ROLL_NUMBER`

If they are not set, the app falls back to the values already configured for this submission.

### Frontend on Vercel or Netlify

Deploy the `frontend/` directory and set:

```bash
VITE_API_BASE_URL=https://your-backend-url.onrender.com
```

Build command:

```bash
npm run build
```

Output directory:

```bash
dist
```
