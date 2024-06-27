use sqlx::Postgres::PgPool;

pub struct AppState {
    pub db: PgPool,
}
