package log

import (
	"net/http"
	"time"

	"github.com/google/uuid"
)

func LoggerMiddleware(logger Logger) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			requestID := uuid.New().String()

			// Enrich logger with request-specific fields.
			reqLogger := logger.With(
				map[string]any{
					"request_id": requestID,
					"path":       r.URL.Path,
					"method":     r.Method,
				},
			)

			ctx := WithContext(r.Context(), reqLogger)

			start := time.Now()
			next.ServeHTTP(w, r.WithContext(ctx))

			reqLogger.Info(ctx, "request completed", "duration_ms", time.Since(start).Milliseconds())
		})
	}
}
