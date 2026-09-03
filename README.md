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

#### Generar un JWT_SECRET valido

El secreto JWT debe ser una cadena codificada en Base64 con al menos 32 bytes (256 bits) para cumple el algoritmo HS256.

**Paso 1:** Abre una terminal.

**Paso 2:** Ejecuta el siguiente comando para generar un secreto aleatorio de 32 bytes codificado en Base64:

```bash
openssl rand -base64 32
```

**Paso 3:** Copia la cadena de texto que se imprime en la terminal (algo similar a `aB3dE5fG7hI9jK1lM3nO5pQ7rS9tU1vW=`).

**Paso 4:** Pega esa cadena como valor de `JWT_SECRET` en tu archivo `.env`:

```properties
JWT_SECRET=aB3dE5fG7hI9jK1lM3nO5pQ7rS9tU1vW=
```

> **Nota:** Si no tienes `openssl` instalado, tambien puedes generar el secreto desde la consola de Java:
>
> ```bash
> java -cp . -e "java.util.Base64.getEncoder().encodeToString(java.security.SecureRandom.getInstanceStrong().generateSeed(32))"
> ```
>
> O usar PowerShell (Windows):
>
> ```powershell
> [Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Minimum 0 -Maximum 256 }) -as [byte[]])
> ```

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
