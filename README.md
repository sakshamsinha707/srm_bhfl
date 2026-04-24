# Backend

Express backend for the SRM challenge.

## Scripts

```bash
npm start
npm run dev
npm test
```

## Docker

From the repo root:

```bash
docker build -t srm-bfhl-api .
docker run --rm -p 8080:8080 srm-bfhl-api
```

## Environment Variables

Copy `.env.example` to `.env` if you want to override the built-in submission identity values.

Available variables:

- `FULL_NAME`
- `DOB_DDMMYYYY`
- `EMAIL_ID`
- `COLLEGE_ROLL_NUMBER`
- `PORT`

## Endpoint

`POST /bfhl`

Request body:

```json
{
  "data": ["A->B", "A->C", "B->D"]
}
```

The route validates node strings, removes duplicate edges, applies the first-parent rule, detects cycles, builds hierarchies, and returns the summary required by the PDF.
