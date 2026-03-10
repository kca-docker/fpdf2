# --- Build Stage --------------------------------------------------------------
FROM golang:1.22-alpine AS builder

WORKDIR /src
COPY . .

ENV CGO_ENABLED=0

# Modul initialisieren, falls noch nicht geschehen
RUN go mod init json2pdf 2>/dev/null || true

# Offiziell gepflegter Fork (Codeberg)
RUN go get codeberg.org/go-pdf/fpdf

RUN go build -ldflags="-s -w" -o app .

# --- Runtime Stage (FROM scratch) ---------------------------------------------
FROM scratch

COPY --from=builder /src/app /app
COPY ppc_settings.json /ppc_settings.json

ENTRYPOINT ["/app"]