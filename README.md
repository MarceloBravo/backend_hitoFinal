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

Antes de empezar, verifica que tengas instalados los siguientes programas. Abre una terminal y ejecuta cada comando para confirmar:

| Programa | Comando para verificar | Version minima | Donde descargar |
|---|---|---|---|
| Java | `java -version` | 17+ | https://adoptium.net |
| Maven | `mvn -version` | 3.9+ | https://maven.apache.org |
| PostgreSQL | `psql --version` | 14+ | https://www.postgresql.org |

> **Que es una terminal?** En Windows: busca "PowerShell" o "cmd" en el menu inicio. En Mac/Linux: busca "Terminal".

Si alguno no esta instalado o no muestra la version, descargalo desde el enlace indicado antes de continuar.

## Pasos para levantar la aplicacion

### 1. Clonar el repositorio

Abre una terminal y ejecuta:

```bash
git clone <url-del-repositorio>
cd backend
```

> Reemplaza `<url-del-repositorio>` con la URL real del repositorio Git.

### 2. Crear la base de datos

Necesitas crear una base de datos vacia para que la aplicacion pueda guardar datos. Tienes dos opciones:

#### Opcion A: Usar pgAdmin (interfaz grafica)

1. Abre **pgAdmin** (se instalo junto con PostgreSQL)
2. Ingresa la contrasena que configuraste al instalar PostgreSQL
3. En el panel izquierdo, haz clic derecho sobre **Servers** > **Register** > **Database**
4. En el campo **Name** escribe: `hitoFinal`
5. Haz clic en **Save**

#### Opcion B: Usar psql (linea de comandos)

Abre una terminal y ejecuta:

```bash
psql -U postgres -c "CREATE DATABASE hitoFinal;"
```

Te pedira la contrasena del usuario `postgres` (la que configuraste al instalar PostgreSQL).

### 3. Configurar variables de entorno

La aplicacion necesita datos de conexion a la base de datos y un secreto para los tokens de seguridad.

**Paso 3.1:** Copia el archivo de ejemplo. Abre una terminal en la carpeta del proyecto y ejecuta:

En **Windows** (PowerShell):
```powershell
Copy-Item .env.example .env
```

En **Mac/Linux**:
```bash
cp .env.example .env
```

**Paso 3.2:** Abre el archivo `.env` con un editor de texto (como VS Code, Notepad++, o el Bloc de notas) y edita los valores:

```properties
DB_NAME=hitoFinal
DB_URL=jdbc:postgresql://localhost:5432/hitoFinal
DB_USERNAME=postgres
DB_PASSWORD=LA_CONTRASENA_QUE_USASTE_AL_INSTALAR_POSTGRESQL

JWT_SECRET=AQUI_VA_EL_SECRETO_QUE_GENERARAS_EN_EL_PASO_3.3
JWT_ACCESS_EXPIRATION=900000
JWT_REFRESH_EXPIRATION=604800000
JWT_COOKIE_SECURE=false
```

> **Importante:** Reemplaza `LA_CONTRASENA_QUE_USASTE_AL_INSTALAR_POSTGRESQL` con tu contrasena real.

**Paso 3.3:** Generar un JWT_SECRET valido.

El secreto JWT es una cadena aleatoria de al menos 32 caracteres que se usa para firmar los tokens de seguridad. Para generarlo:

En **Windows** (PowerShell), ejecuta este comando en la terminal:
```powershell
-join ((1..32) | ForEach-Object { [char](Get-Random -Minimum 33 -Maximum 127) })
```

En **Mac/Linux**, ejecuta:
```bash
openssl rand -base64 32
```

Copia la cadena de texto que se imprime en la terminal (algo similar a `aB3dE5fG7hI9jK1lM3nO5pQ7rS9tU1vW=`).

**Paso 3.4:** Pega esa cadena como valor de `JWT_SECRET` en tu archivo `.env`:
```properties
JWT_SECRET=aB3dE5fG7hI9jK1lM3nO5pQ7rS9tU1vW=
```

### 4. Configurar poblacion de la base de datos

La aplicacion incluye un archivo `src/main/resources/data.sql` con datos de prueba: 25 productos, 14 usuarios, 10 categorias, 11 marcas y 3 carritos. Elegi **una** de las siguientes opciones:

#### Opcion A: Poblacion automatica al ejecutar la app (recomendada para principiantes) 

### (Esta es la opción por defecto configurada)

Abre el archivo `src/main/resources/application.yml` con un editor de texto y verifica que esta configurado asi:

```yaml
spring:
  jpa:
    defer-datasource-initialization: true
  sql:
    init:
      mode: always
      data-locations: classpath:data.sql
```

Con esta configuracion, el script `data.sql` se ejecuta automaticamente cuando inicias la aplicacion.

> **Despues del primer arranque**, cambia `always` por `never` en el mismo archivo para que los datos no se vuelvan a insertar:
> ```yaml
> spring:
>   sql:
>     init:
>       mode: never
> ```

#### Opcion B: Poblacion manual con psql

Abre el archivo `src/main/resources/application.yml` con un editor de texto y deja la configuracion asi:

```yaml
spring:
  jpa:
    defer-datasource-initialization: true
  sql:
    init:
      mode: never
      data-locations: classpath:data.sql
```

Los datos se insertaran manualmente en el paso 6.

### 5. Compilar y ejecutar

Abre una terminal en la carpeta del proyecto y ejecuta uno de estos comandos:

**Opcion 1** (recomendada):
```bash
mvn spring-boot:run
```

**Opcion 2**:
```bash
mvn clean package -DskipTests
java -jar target/hitoFinal-0.0.1-SNAPSHOT.war
```

**Si elegiste la Opcion A** en el paso 4: los datos se insertaran automaticamente al iniciar. Espera a que veas el mensaje `Started EShopApplication` en la terminal.

**Si elegiste la Opcion B** en el paso 4: la aplicacion solo creara las tablas. Continua al paso 6.

La aplicacion estara disponible en **http://localhost:8080**.

### 6. Insertar datos iniciales (solo Opcion B)

> Si elegiste la Opcion A en el paso 4, **ignora este paso**. Los datos ya se insertaron en el paso 5.

**Paso 6.1:** Deten la aplicacion presionando `Ctrl+C` en la terminal.

**Paso 6.2:** Ejecuta el script manualmente. En **Windows** (PowerShell):
```powershell
psql -U postgres -d hitoFinal -f src/main/resources/data.sql
```

En **Mac/Linux**:
```bash
psql -U postgres -d hitoFinal -f src/main/resources/data.sql
```

Te pedira la contrasena del usuario `postgres`. Al terminar, veras mensajes como `INSERT 0 1` por cada fila insertada.

> Si `psql` no se encuentra, probablemente no esta en el PATH. Busca PostgreSQL en `C:\Program Files\PostgreSQL\16\bin\` (ajusta la version) y ejecuta desde ahi, o agrega esa carpeta al PATH del sistema.

**Paso 6.3:** Vuelve a ejecutar la aplicacion:
```bash
mvn spring-boot:run
```

### 7. Verificar

Abre tu navegador y verifica que la aplicacion este funcionando:

| Que verificar | URL | Que deberias ver |
|---|---|---|
| API principal | http://localhost:8080/ | Mensaje de bienvenida o error 404 (es normal) |
| Swagger UI | http://localhost:8080/swagger-ui.html | Documentacion interactiva de la API |
| API Docs | http://localhost:8080/api-docs | Especificacion OpenAPI en formato JSON |

#### Credenciales de prueba

El script `data.sql` crea un usuario administrador necesario para gestionar usuarios, productos, categorias y marcas desde la el BackOffice de administración de la aplicacion:

| Usuario | Email | Contrasena | Rol |
|---|---|---|---|
| Admin Principal | admin@eshop.com | admin123 | ADMIN |

> Todos los demas usuarios de prueba usan la contrasena `user123`.

## Ejecutar tests

Los tests verifican que el codigo funcione correctamente. Para ejecutarlos:

```bash
mvn test
```

Los tests usan H2 como base de datos embebida, no necesitas PostgreSQL para correrlos.

## Perfiles

La aplicacion tiene dos perfiles de configuracion:

| Perfil | Documentacion Swagger | Logs SQL | Cuando usarlo |
|---|---|---|---|
| `dev` (default) | Activo | Activos | Desarrollo local |
| `prod` | Desactivado | Inactivos | Produccion (servidor real) |

## Solucion de problemas

| Problema | Solucion |
|---|---|
| `java: command not found` | Java no esta instalado o no esta en el PATH. Verifica la instalacion. |
| `mvn: command not found` | Maven no esta instalado o no esta en el PATH. Verifica la instalacion. |
| `psql: command not found` | PostgreSQL no esta en el PATH. Usa la ruta completa o agrega el bin de PostgreSQL al PATH. |
| `Connection refused` al conectar a PostgreSQL | PostgreSQL no esta corriendo. Inicia el servicio desde pgAdmin o servicios del sistema. |
| `password authentication failed` | La contrasena en `.env` no coincide con la de PostgreSQL. Verifica el valor de `DB_PASSWORD`. |
| `port 5432 already in use` | Otro proceso esta usando el puerto 5432. Deten ese proceso o cambia el puerto de PostgreSQL. |
| La app inicia pero no hay datos | Verifica que `sql.init.mode` este en `always` (Opcion A) o ejecuta el paso 6 (Opcion B). |

## Licencia

Proyecto academico - Desafio Latam
