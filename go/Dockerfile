# --- Build Stage --------------------------------------------------------------
FROM golang:1.22-alpine AS builder

WORKDIR /src
COPY . .

ENV CGO_ENABLED=0

# Modul initialisieren, falls noch nicht geschehen
RUN go mod init json2pdf 2>/dev/null || true

# Offiziell gepflegter Fork (Codeberg)
RUN go get codeberg.org/go-pdf/fpdf
RUN go mod tidy

RUN ls -la
RUN go build -ldflags="-s -w" -o /app-bin .
RUN ls -la

# --- Runtime Stage (FROM scratch) ---------------------------------------------
FROM scratch

COPY --from=builder /app-bin /app
#COPY *.json ./

ENTRYPOINT ["/app"]