package auth

import (
	"context"
	"crypto/rsa"
	"encoding/base64"
	"encoding/json"
	"errors"
	"fmt"
	"math/big"
	"net/http"
	"sync"
)

type JWKS struct {
	Keys []JSONWebKey `json:"keys"`
}

type JSONWebKey struct {
	Kid string `json:"kid"`
	Kty string `json:"kty"`
	Alg string `json:"alg"`
	N   string `json:"n"`
	E   string `json:"e"`
}

type JWKSFetcher struct {
	jwksURL string
	cache   map[string]*rsa.PublicKey
	mu      sync.RWMutex
}

func NewJWKSFetcher(jwksURL string) *JWKSFetcher {
	return &JWKSFetcher{
		jwksURL: jwksURL,
		cache:   make(map[string]*rsa.PublicKey),
	}
}

func (f *JWKSFetcher) FetchAndCache(ctx context.Context) error {
	req, _ := http.NewRequestWithContext(ctx, http.MethodGet, f.jwksURL, nil)
	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	var jwks JWKS
	if err := json.NewDecoder(resp.Body).Decode(&jwks); err != nil {
		return err
	}

	f.mu.Lock()
	defer f.mu.Unlock()
	for _, key := range jwks.Keys {
		if key.Kty == "RSA" {
			pubKey, err := key.toRSAPublicKey()
			if err != nil {
				return err
			}
			f.cache[key.Kid] = pubKey
		}
	}
	return nil
}

func (f *JWKSFetcher) GetPublicKey(kid string) (*rsa.PublicKey, error) {
	f.mu.RLock()
	defer f.mu.RUnlock()
	key, exists := f.cache[kid]
	if !exists {
		return nil, errors.New("key not found in JWKS cache")
	}
	return key, nil
}

func (j *JSONWebKey) toRSAPublicKey() (*rsa.PublicKey, error) {
	nBytes, err := base64.RawURLEncoding.DecodeString(j.N)
	if err != nil {
		return nil, fmt.Errorf("failed to decode n: %w", err)
	}
	eBytes, err := base64.RawURLEncoding.DecodeString(j.E)
	if err != nil {
		return nil, fmt.Errorf("failed to decode e: %w", err)
	}

	n := new(big.Int).SetBytes(nBytes)
	e := new(big.Int).SetBytes(eBytes).Int64()

	return &rsa.PublicKey{
		N: n,
		E: int(e),
	}, nil
}
