package zap

import (
	"context"

	"github.com/blendle/zapdriver"
	"go.uber.org/zap"

	"github.com/kbremont/tattoo-app/internal/pkg/log"
)

// ContextKey is a key for Context values
type ContextKey string

// Logger is a zap-based implementation of log.Logger.
type Logger struct {
	logger *zap.Logger

	contextKeys []ContextKey
}

var _ log.Logger = new(Logger)

// NewLogger returns a configured *Logger.
func NewLogger(opts ...Option) (*Logger, error) {
	l, err := zapdriver.NewDevelopment(zap.AddCallerSkip(1))
	if err != nil {
		return nil, err
	}

	logger := &Logger{logger: l}

	for _, opt := range opts {
		opt(logger)
	}

	return logger, nil
}

// Debug writes a debug-level log message.
func (l *Logger) Debug(ctx context.Context, msg string, fields ...log.Field) {
	fields = append(l.parseContextKeys(ctx), fields...)
	l.logger.Debug(msg, parseFields(fields...)...)
}

// Error write an error-level log message.
func (l *Logger) Error(ctx context.Context, msg string, fields ...log.Field) {
	fields = append(l.parseContextKeys(ctx), fields...)
	l.logger.Error(msg, parseFields(fields...)...)
}

// Info writes an info-level log message.
func (l *Logger) Info(ctx context.Context, msg string, fields ...log.Field) {
	fields = append(l.parseContextKeys(ctx), fields...)
	l.logger.Info(msg, parseFields(fields...)...)
}

// Warn writes a warn-level log message.
func (l *Logger) Warn(ctx context.Context, msg string, fields ...log.Field) {
	fields = append(l.parseContextKeys(ctx), fields...)
	l.logger.Warn(msg, parseFields(fields...)...)
}

// Fatal writes a fatal-level log message.
func (l *Logger) Fatal(ctx context.Context, msg string, fields ...log.Field) {
	fields = append(l.parseContextKeys(ctx), fields...)
	l.logger.Fatal(msg, parseFields(fields...)...)
}

func (l *Logger) parseContextKeys(ctx context.Context) []log.Field {
	var fields []log.Field
	for _, key := range l.contextKeys {
		if v := ctx.Value(key); v != nil {
			fields = append(fields, log.Any(string(key), v))
		}
	}

	return fields
}

func parseFields(fields ...log.Field) []zap.Field {
	var m []zap.Field
	for _, field := range fields {
		m = append(m, zap.Any(field.Key, field.Value))
	}

	return m
}
