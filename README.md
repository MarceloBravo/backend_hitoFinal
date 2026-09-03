# E-Shop Backend

API REST para tienda en linea construida con Spring Boot y Clean Architecture.

## Stack

- **Java 17** / Spring Boot 4.1.1
- **PostgreSQL** (base de datos)
- **Spring Security** + JWT (autenticacion via cookies)
- **Spring Data JPA** (persistencia)
- **Lombok** (boilerplate reduction)
- **SpringDoc OpenAPI** (documentacion Swagger, solo en perfil `dev`)
- **JUnit 5** + H2 (tests)

## Arquitectura

```
src/main/java/com/mabc/e_shop/
├── domain/              # Entidades, value objects, repositorios (interfaces), excepciones
├── application/         # Casos de uso
├── infrastructure/
│   ├── config/          # Configuracion Spring (CORS, Storage, OpenAPI)
│   ├── http/            # Controllers, DTOs, mappers, exception handler
│   ├── persistence/     # Entities JPA, repositorios JPA, mappers
│   ├── security/        # JWT, filtros, AuthService, AdminUserService
│   └── storage/         # Almacenamiento local de imagenes
```

## Funcionalidades

- CRUD de productos, categorias y marcas
- Carrito de compras (agregar, decrementar, eliminar items)
- Checkout
- Subida de imagenes de producto (almacenamiento local en `uploads/`)
- Autenticacion JWT con httpOnly cookies
- Registro y login de usuarios
- Documentacion Swagger en perfil `dev`

## Requisitos previos

- Java 17+
- Maven 3.9+
- PostgreSQL 14+ corriendo localmente

## Pasos para levantar la aplicacion

### 1. Clonar el repositorio

```bash
git clone <url-del-repositorio>
cd backend
```

### 2. Crear la base de datos

```sql
CREATE DATABASE hitoFinal;
```

### 3. Configurar variables de entorno

Copia el archivo de ejemplo y completa los valores:

```bash
cp .env.example .env
```

Edita `.env` con tus datos:

```properties
DB_NAME=hitoFinal
DB_URL=jdbc:postgresql://localhost:5432/hitoFinal
DB_USERNAME=postgres
DB_PASSWORD=tu_password

JWT_SECRET=tu_secreto_base64_de_32_bytes_minimo
JWT_ACCESS_EXPIRATION=900000
JWT_REFRESH_EXPIRATION=604800000
JWT_COOKIE_SECURE=false
```

> Genera un secreto valido con: `openssl rand -base64 32`

### 4. Compilar y ejecutar

```bash
mvn clean package -DskipTests
java -jar target/hitoFinal-0.0.1-SNAPSHOT.war
```

O directamente con el plugin de Spring Boot:

```bash
mvn spring-boot:run
```

La aplicacion arranca en **http://localhost:8080**.

### 5. Verificar

- API: `http://localhost:8080/`
- Swagger UI (solo perfil dev): `http://localhost:8080/swagger-ui.html`
- API Docs: `http://localhost:8080/api-docs`

## Ejecutar tests

```bash
mvn test
```

Los tests usan H2 como base de datos embebida, no necesitas PostgreSQL para correrlos.

## Perfiles

| Perfil | Swagger | SQL logs | Uso |
|--------|---------|----------|-----|
| `dev` (default) | Activo | Activos | Desarrollo local |
| `prod` | Desactivado | Inactivos | Produccion |

## Licencia

Proyecto academico - Desafio Latam
