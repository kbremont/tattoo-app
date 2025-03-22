# Backend

The backend is comprised of a Go API which uses the [ConnectRPC framework](https://connectrpc.com/docs/introduction) and a
[Postgres instance](#postgres-instance). The API currently consists of the [User Service](#user-service).

## Postgres Instance

The Postgres instance is currently created in [Render](https://render.com/). It consists of `user` and `auth_accounts` tables.

## User Service

The User Service is responsible for performing CRUD operations on the `user` table. It manages user profile info
(name, preferences, etc.).
