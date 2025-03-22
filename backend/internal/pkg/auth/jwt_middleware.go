package auth

import (
	"context"
	"net/http"
	"strings"

	"github.com/golang-jwt/jwt/v5"
	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
)

func JWTMiddleware(fetcher *JWKSFetcher, logger log.Logger) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			authHeader := r.Header.Get("Authorization")
			if !strings.HasPrefix(authHeader, "Bearer ") {
				http.Error(w, "missing bearer token", http.StatusUnauthorized)
				return
			}

			tokenString := strings.TrimPrefix(authHeader, "Bearer ")

			parsedToken, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
				if kid, ok := token.Header["kid"].(string); ok {
					return fetcher.GetPublicKey(kid)
				}
				return nil, jwt.ErrInvalidKey
			})

			if err != nil || !parsedToken.Valid {
				http.Error(w, "invalid token", http.StatusUnauthorized)
				return
			}

			// Inject claims (e.g., sub) into ctx
			claims, ok := parsedToken.Claims.(jwt.MapClaims)
			if !ok {
				http.Error(w, "invalid claims", http.StatusUnauthorized)
				return
			}

			ctx := r.Context()
			if sub, ok := claims["sub"].(string); ok {
				ctx = context.WithValue(ctx, "auth0_user_id", sub)
			}

			logger := log.FromContext(ctx)
			logger.Info(ctx, "JWT validated", "sub", claims["sub"])

			next.ServeHTTP(w, r.WithContext(ctx))
		})
	}
}
