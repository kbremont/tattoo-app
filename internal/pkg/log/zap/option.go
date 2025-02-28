package zap

// Option is an option that can be provided when creating a *Logger.
type Option func(l *Logger)

const (
	// UserAgentKey is a context key used to store the user agent
	UserAgentKey = ContextKey("user_agent")

	// RequestIDKey is a context key used to store the request id
	RequestIDKey = ContextKey("request_id")
)

// WithContextKeyLogging configures the Logger to log the specified
// context keys.
func WithContextKeyLogging(contextKeys []ContextKey) Option {
	return func(l *Logger) { l.contextKeys = contextKeys }
}
