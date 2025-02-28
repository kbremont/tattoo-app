package log

import (
	"context"
)

type (
	// Logger is the interface for writing log messages.
	Logger interface {
		// Debug writes a debug-level log message.
		Debug(ctx context.Context, msg string, fields ...Field)
		// Error write an error-level log message.
		Error(ctx context.Context, msg string, fields ...Field)
		// Info writes an info-level log message.
		Info(ctx context.Context, msg string, fields ...Field)
		// Warn writes a warn-level log message.
		Warn(ctx context.Context, msg string, fields ...Field)
		// Fatal writes a fatal-level log message.
		Fatal(ctx context.Context, msg string, fields ...Field)
	}

	// Field is a log field with a key and a value.
	Field struct {
		// Key is the descriptor of the object in Value.
		Key string
		// Value is the object to include in the log field.
		Value interface{}
	}
)

// Any creates a log field based on the specified key and value.
func Any(key string, value interface{}) Field {
	return Field{Key: key, Value: value}
}

// Error creates a log field based on the specified error.
func Error(err error) Field {
	return Field{Key: "error", Value: err}
}

type ctxKey struct{}

var (
	ctxLoggerKey = &ctxKey{}
)

// WithLogger returns a context containing the specified logger
func WithLogger(ctx context.Context, logger Logger) context.Context {
	return context.WithValue(ctx, ctxLoggerKey, logger)
}

// GetLogger returns the logger stored in ctx
func GetLogger(ctx context.Context) Logger {
	logger, ok := ctx.Value(ctxLoggerKey).(Logger)
	if !ok || logger == nil {
		return nil
	}
	return logger
}
