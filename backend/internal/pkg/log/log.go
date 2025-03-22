package log

import (
	"context"
)

type Logger interface {
	With(fields map[string]any) Logger
	WithError(err error) Logger
	Info(ctx context.Context, msg string, args ...any)
	Debug(ctx context.Context, msg string, args ...any)
	Warn(ctx context.Context, msg string, args ...any)
	Error(ctx context.Context, msg string, args ...any)
}

type ctxLoggerKey struct{}

var fallbackLogger Logger

func SetFallbackLogger(l Logger) {
	fallbackLogger = l
}

func WithContext(ctx context.Context, logger Logger) context.Context {
	return context.WithValue(ctx, ctxLoggerKey{}, logger)
}

func FromContext(ctx context.Context) Logger {
	l, ok := ctx.Value(ctxLoggerKey{}).(Logger)
	if !ok || l == nil {
		return fallbackLogger
	}
	return l
}
