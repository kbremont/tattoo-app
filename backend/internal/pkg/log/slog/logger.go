// /internal/pkg/log/slog/logger.go
package slog

import (
	"context"
	"log/slog"
	"os"

	"github.com/kbremont/tattoo-app/backend/internal/pkg/log"
)

type Logger struct {
	logger *slog.Logger
}

var _ log.Logger = new(Logger)

func New() log.Logger {
	l := slog.New(slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelInfo}))

	return &Logger{logger: l}
}

func (l *Logger) With(fields map[string]any) log.Logger {
	args := convertToSlogArgs(fields)
	newLogger := l.logger.With(args...)
	return &Logger{logger: newLogger}
}

func (l *Logger) WithError(err error) log.Logger {
	return l.With(map[string]any{"error": err})
}

func (l *Logger) Info(ctx context.Context, msg string, args ...any) {
	l.logger.InfoContext(ctx, msg, args...)
}

func (l *Logger) Debug(ctx context.Context, msg string, args ...any) {
	l.logger.DebugContext(ctx, msg, args...)
}

func (l *Logger) Warn(ctx context.Context, msg string, args ...any) {
	l.logger.WarnContext(ctx, msg, args...)
}

func (l *Logger) Error(ctx context.Context, msg string, args ...any) {
	l.logger.ErrorContext(ctx, msg, args...)
}

func convertToSlogArgs(fields map[string]any) []interface{} {
	var args []any
	for k, v := range fields {
		args = append(args, k, v)
	}

	return args
}
