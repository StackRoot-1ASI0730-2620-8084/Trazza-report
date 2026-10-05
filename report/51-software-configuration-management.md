## 5.1. Software Configuration Management

En esta sección el equipo StackRoot establece las decisiones y convenciones que permiten mantener la consistencia de Trazza durante todo su ciclo de vida. Se describen las herramientas que utiliza cada integrante para colaborar, la organización de los repositorios en GitHub, el flujo de trabajo GitFlow, las convenciones de versionamiento y de mensajes de commit, las guías de estilo de cada lenguaje y la configuración de despliegue de los productos digitales de la solución: Landing Page, Frontend Web Application y RESTful Web Services.

### 5.1.1. Software Development Environment Configuration

A continuación se presentan los productos de software que utiliza el equipo, agrupados por tipo de actividad. Para cada producto se indica el propósito de uso dentro del proyecto y la ruta de referencia (productos SaaS) o la ruta de descarga (productos que se instalan en el computador de cada integrante). La selección respeta las restricciones tecnológicas establecidas para el proyecto.

#### Project Management

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| JetBrains YouTrack | Gestión del Product Backlog, planificación de Sprints, tablero ágil (To-do / In-Process / To-Review / Done) y seguimiento de las tareas asignadas a cada integrante. | SaaS | [https://trazza.youtrack.cloud](https://trazza.youtrack.cloud/agiles/204-1/current) |
| GitHub (Organization) | Organización `StackRoot-1ASI0730-2620-8084`, que agrupa los repositorios del proyecto y la gestión de Pull Requests y revisiones de código. | SaaS | [https://github.com/StackRoot-1ASI0730-2620-8084](https://github.com/StackRoot-1ASI0730-2620-8084) |
| Microsoft Teams | Reuniones de Sprint Planning, Daily Scrum, Sprint Review y Sprint Retrospective. | SaaS / Desktop | [https://teams.microsoft.com](https://teams.microsoft.com) |

#### Requirements Management

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| JetBrains YouTrack | Registro de Epics y User Stories, estimación en Story Points (escala Fibonacci) y priorización del Product Backlog. | SaaS | [https://trazza.youtrack.cloud](https://trazza.youtrack.cloud/agiles/204-1/current) |
| Gherkin | Lenguaje para redactar los criterios de aceptación de cada User Story bajo la estructura Given / When / Then. | Especificación | [https://cucumber.io/docs/gherkin/reference/](https://cucumber.io/docs/gherkin/reference/) |
| GitHub Markdown | Documentación versionada de requisitos y del Project Report bajo el enfoque document as code. | SaaS | [https://docs.github.com/en/get-started/writing-on-github](https://docs.github.com/en/get-started/writing-on-github) |

#### Product UX/UI Design

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| UXPressia | Elaboración de User Personas, Empathy Maps, User Journey Maps e Impact Maps. | SaaS | [https://uxpressia.com](https://uxpressia.com) |
| Figma | Diseño de Wireframes, Mock-ups y Prototypes del Landing Page y de la Web Application (Desktop y Mobile). | SaaS | [https://www.figma.com](https://www.figma.com) |
| FigJam | Elaboración del EventStorming, Wireflow Diagrams y User Flow Diagrams. | SaaS | [https://www.figma.com/figjam/](https://www.figma.com/figjam/) |
| Material Design 3 | Lenguaje de diseño base para la interfaz del Landing Page y de la Web Application. | Guía | [https://m3.material.io](https://m3.material.io) |

#### Software Architecture & Design

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| PlantUML (C4-PlantUML) | Diagramas como código (Diagram-as-Code) para el C4 Model (Context, Container y Component), el Class Diagram y el Database Diagram. Los archivos `.puml` se versionan en `assets/diagram-as-code` del repositorio del informe. | Open source | [https://plantuml.com](https://plantuml.com) |
| Visual Studio Code + extensión PlantUML | Edición y previsualización local de los diagramas `.puml`. | Desktop | [https://code.visualstudio.com/download](https://code.visualstudio.com/download) |

#### Software Development

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| Git | Sistema de control de versiones distribuido utilizado por todos los integrantes. | Desktop | [https://git-scm.com/downloads](https://git-scm.com/downloads) |
| JetBrains WebStorm | IDE para el desarrollo del Landing Page (HTML5, CSS3, JavaScript) y de la Frontend Web Application (Vue). | Desktop | [https://www.jetbrains.com/webstorm/download/](https://www.jetbrains.com/webstorm/download/) |
| Visual Studio Code | Editor alternativo para el Landing Page, la Web Application y los archivos Markdown del informe. | Desktop | [https://code.visualstudio.com/download](https://code.visualstudio.com/download) |
| Node.js (LTS) + npm | Entorno de ejecución y gestor de paquetes para construir la Web Application con Vite. | Desktop | [https://nodejs.org/en/download](https://nodejs.org/en/download) |
| Vue 3 + Vite | Framework y herramienta de construcción de la Frontend Web Application. | Librería | [https://vuejs.org](https://vuejs.org) |
| PrimeVue | Biblioteca de componentes de UI para la Web Application, con tema basado en Material Design. | Librería | [https://primevue.org](https://primevue.org) |
| Vue Router · Pinia · Vue I18n | Navegación entre vistas, manejo de estado por bounded context e internacionalización (en_US por defecto, es_419). | Librería | [https://router.vuejs.org](https://router.vuejs.org) · [https://pinia.vuejs.org](https://pinia.vuejs.org) · [https://vue-i18n.intlify.dev](https://vue-i18n.intlify.dev) |
| Axios | Cliente HTTP para consumir el Fake API (Sprint 2) y luego la RESTful API. | Librería | [https://axios-http.com](https://axios-http.com) |
| json-server | Fake API basado en un archivo `db.json`, utilizado mientras se implementan los Web Services en ASP.NET Core. | Librería | [https://github.com/typicode/json-server](https://github.com/typicode/json-server) |
| JetBrains Rider | IDE para el desarrollo de la RESTful API en C# con ASP.NET Core y Entity Framework Core. | Desktop | [https://www.jetbrains.com/rider/download/](https://www.jetbrains.com/rider/download/) |
| .NET SDK | SDK para compilar y ejecutar los Web Services en ASP.NET Core. | Desktop | [https://dotnet.microsoft.com/en-us/download](https://dotnet.microsoft.com/en-us/download) |
| MySQL Server + MySQL Workbench | Motor de base de datos relacional y herramienta de administración y consultas. | Desktop | [https://dev.mysql.com/downloads/](https://dev.mysql.com/downloads/) |

#### Software Testing

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| Swagger UI (OpenAPI Specification) | Documentación y prueba manual de los endpoints de la RESTful API. | Librería | [https://swagger.io/tools/swagger-ui/](https://swagger.io/tools/swagger-ui/) |
| Chrome DevTools | Pruebas de responsive design (Desktop 1280 px / Mobile 390 px), revisión de atributos ARIA y depuración de llamadas HTTP. | Desktop | [https://developer.chrome.com/docs/devtools](https://developer.chrome.com/docs/devtools) |
| Lighthouse | Auditoría de accesibilidad, rendimiento y SEO del Landing Page y la Web Application. | Desktop | [https://developer.chrome.com/docs/lighthouse](https://developer.chrome.com/docs/lighthouse) |

#### Software Deployment

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| AWS Amplify Hosting | Publicación continua del Landing Page y de la Frontend Web Application a partir de la rama `main` de cada repositorio. | SaaS (Cloud) | [https://aws.amazon.com/amplify/hosting/](https://aws.amazon.com/amplify/hosting/) |
| Render (Web Service) | Publicación temporal del Fake API (json-server) consumido por la primera versión de la Web Application. | SaaS (Cloud) | [https://render.com](https://render.com) |
| AWS EC2 · AWS RDS for MySQL | Infraestructura planificada para la RESTful API y su base de datos a partir del Sprint 3. | SaaS (Cloud) | [https://aws.amazon.com](https://aws.amazon.com) |

#### Software Documentation

| Producto | Propósito en el proyecto | Tipo | Ruta |
| :--- | :--- | :--- | :--- |
| GitHub (Trazza-report) | Redacción y control de versiones del Project Report en Markdown. | SaaS | [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report) |
| Microsoft Stream | Publicación de los videos de exposición, entrevistas y navegación por Sprint. | SaaS | [https://www.microsoft.com/microsoft-365/microsoft-stream](https://www.microsoft.com/microsoft-365/microsoft-stream) |
| OpenAPI (Swagger) | Documentación de los Web Services desde el propio proyecto ASP.NET Core. | Especificación | [https://swagger.io/specification/](https://swagger.io/specification/) |

### 5.1.2. Source Code Management

El equipo utiliza GitHub como plataforma y sistema de control de versiones. Todos los repositorios pertenecen a la organización `StackRoot-1ASI0730-2620-8084`, y cada producto digital tiene un repositorio independiente, lo que permite que cada uno tenga su propio historial, su propia configuración de despliegue y sus propias versiones.

| Producto | Repositorio | Contenido |
| :--- | :--- | :--- |
| Project Report | [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report) | Informe en Markdown, imágenes y diagramas como código (`.puml`). |
| Landing Page | [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-LandingPage](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-LandingPage) | Sitio estático en HTML5, CSS3 y JavaScript con i18n (EN / ES). |
| Frontend Web Application | [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-WebAplication](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-WebAplication) | Aplicación Vue 3 + PrimeVue organizada por bounded context y Fake API en `server/db.json`. |
| Web Services (RESTful API) | `https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-API` (se crea en el Sprint 3) | Proyecto ASP.NET Core + Entity Framework Core y sus pruebas unitarias y de integración/aceptación. |

#### GitFlow Workflow

El equipo aplica el modelo de ramificación GitFlow propuesto por Vincent Driessen en A successful Git branching model. Este modelo separa el trabajo en progreso de las versiones estables y define el camino que recorre cada cambio hasta llegar a producción.

**Main branches**

| Rama | Propósito | Regla |
| :--- | :--- | :--- |
| `main` | Contiene únicamente versiones estables y desplegadas. Cada merge a `main` dispara el despliegue automático en AWS Amplify. | Solo recibe merges desde `release/*` o `hotfix/*`, y cada merge se etiqueta con su versión (`vX.Y.Z`). |
| `develop` | Rama de integración en la que se consolidan las funcionalidades terminadas antes de un release. | Recibe merges desde `feature/*` mediante Pull Request revisado por al menos un integrante. |

**Supporting branches**

| Tipo | Se crea desde | Se integra en | Convención de nombre | Ejemplos |
| :--- | :--- | :--- | :--- | :--- |
| Feature | `develop` | `develop` | `feature/<user-story-id>-<short-description>` en kebab-case e inglés. Para tareas sin User Story se usa el nombre del aspecto. | `feature/us03-sign-in`, `feature/us08-publish-return-route`, `feature/i18n-language-switch` |
| Release | `develop` | `main` y `develop` | `release/v<MAJOR>.<MINOR>.<PATCH>` | `release/v1.1.0`, `release/v0.1.0` |
| Hotfix | `main` | `main` y `develop` | `hotfix/v<MAJOR>.<MINOR>.<PATCH>-<short-description>` | `hotfix/v1.1.1-mobile-menu-overflow` |

En el repositorio del informe se aplica la misma estrategia: cada sección del informe se trabaja en una rama `feature/<número-de-sección>-<nombre>` (por ejemplo `feature/44-web-applications-ux-ui-design` o `feature/51-software-configuration-management`) y se integra a `develop` mediante Pull Request.

#### Semantic Versioning

Los releases de cada producto se nombran con Semantic Versioning 2.0.0 (`MAJOR.MINOR.PATCH`):

* **MAJOR**: cambios incompatibles con la versión anterior (por ejemplo, un cambio en el contrato de la API).
* **MINOR**: nuevas funcionalidades compatibles con la versión anterior.
* **PATCH**: corrección de errores que no altera la funcionalidad.

Mientras la Web Application y la RESTful API estén en desarrollo inicial se usa la serie `0.y.z`; la versión `1.0.0` se reserva para el primer release completo con los Web Services integrados.

| Producto | Versión | Entrega | Alcance |
| :--- | :--- | :--- | :--- |
| Landing Page | `v1.0.0` | AV1 – Sprint 1 | Primera versión del Landing Page desplegada en AWS Amplify. |
| Landing Page | `v1.1.0` | TB1 – Sprint 2 | Inglés como idioma por defecto, selector EN / ES funcional, rediseño según el mock-up actualizado y fotografías reales en las secciones para transportistas y comerciantes. |
| Frontend Web Application | `v0.1.0` | TB1 – Sprint 2 | Primera versión desplegada: Sign up / Sign in, dashboards por rol, rutas de retorno, solicitudes de flete, vehículos e historial de envíos sobre el Fake API. |
| RESTful API | `v0.1.0` | AV2 – Sprint 3 | Primera versión de los Web Services documentados con OpenAPI. |

#### Conventional Commits

Los mensajes de commit siguen la especificación Conventional Commits 1.0.0, con el mensaje redactado en inglés y en modo imperativo:

```text
<type>(<optional scope>): <short description>

<optional body: qué cambió y por qué>

<optional footer: Refs #issue / BREAKING CHANGE>
```

| Tipo | Uso |
| :--- | :--- |
| `feat` | Nueva funcionalidad (User Story o task). |
| `fix` | Corrección de un error. |
| `docs` | Cambios en el informe o en la documentación. |
| `style` | Cambios de formato que no afectan la lógica. |
| `refactor` | Mejora interna del código sin cambiar su comportamiento. |
| `test` | Creación o modificación de pruebas. |
| `chore` | Configuración, dependencias o tareas de mantenimiento. |

Ejemplos tomados del historial del proyecto:

* `feat: make the EN | ES language switch translate the site` (Trazza-LandingPage)
* `feat: add real photos to the carriers and merchants sections` (Trazza-LandingPage)
* `docs(chapter4): add web application mock up & userflows images` (Trazza-report)
* `docs(chapter4): update web application ux ui design` (Trazza-report)

### 5.1.3. Source Code Style Guide & Conventions

En todos los productos de la solución se utiliza el **inglés** para nombrar archivos, carpetas, variables, funciones, clases, componentes, tablas, columnas, endpoints y mensajes de commit. Los textos que ve el usuario se manejan con i18n (en_US por defecto y es_419). A continuación se indican las guías adoptadas por lenguaje.

**HTML5**

Referencias: [W3Schools HTML Style Guide and Coding Conventions](https://www.w3schools.com/html/html5_syntax.asp) y [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html).

* Declarar `<!DOCTYPE html>` y el atributo `lang` en la etiqueta `<html>` (`lang="en"` por defecto).
* Elementos y atributos en minúsculas, valores de atributos entre comillas dobles e indentación de 2 espacios.
* Uso de etiquetas semánticas (`header`, `nav`, `main`, `section`, `footer`).
* Todas las imágenes incluyen `alt`, y los controles sin texto visible incluyen `aria-label` (a11y).
* Los textos traducibles se marcan con `data-i18n`, por ejemplo `<a href="#plans" data-i18n="nav.plans">Plans</a>`.

**CSS3**

Referencias: [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html).

* Clases e IDs en kebab-case y con nombres que describen su función (`.split-media`, `#how-it-works`).
* Colores, tipografía y espaciados definidos como variables en `:root` (por ejemplo `--color-primary: #0037B0`).
* Sin estilos en línea; enfoque mobile first con media queries para tablet y desktop.

**JavaScript**

Referencias: [Google JavaScript Style Guide](https://google.github.io/styleguide/jsguide.html), [MDN JavaScript guidelines](https://developer.mozilla.org/en-US/docs/MDN/Writing_guidelines/Writing_style_guide/Code_style_guide/JavaScript) y [W3Schools JavaScript Style Guide](https://www.w3schools.com/js/js_conventions.asp).

* `const` por defecto, `let` solo cuando la variable se reasigna; no se usa `var`.
* camelCase para variables y funciones (`applyLanguage`, `returnRoutes`), PascalCase para clases y UPPER_SNAKE_CASE para constantes (`STORAGE_KEY`).
* Punto y coma al final de cada sentencia, comillas simples y funciones flecha en callbacks.
* Uso de `async/await` para operaciones asíncronas.

**Vue Framework**

Referencia: [Vue Style Guide](https://vuejs.org/style-guide/) (reglas de prioridad A y B).

* Componentes en PascalCase y con nombres de más de una palabra (`ReturnRouteForm.vue`, `ShipmentHistoryTable.vue`).
* Composition API con `<script setup>` y props declaradas con tipo.
* Estructura de carpetas por bounded context: `src/iam`, `src/profiles-fleet`, `src/freight-publishing`, `src/matching`, `src/trip-tracking`, `src/reputation`, `src/subscriptions`, y dentro de cada uno `domain/model`, `application`, `infrastructure` y `presentation`.
* Componentes de PrimeVue para la UI; textos de la interfaz siempre a través de `$t('key')` (Vue I18n).

**C# y ASP.NET Core**

Referencias: [C# Coding Conventions](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions) y [Microsoft ASP.NET Core Coding Guidelines](https://github.com/dotnet/aspnetcore/wiki/Engineering-guidelines#coding-guidelines).

* PascalCase para clases, métodos y propiedades públicas (`ReturnRoute`, `GetByCarrierIdAsync`); camelCase para variables locales y parámetros; prefijo `_` para campos privados y prefijo `I` para interfaces (`IReturnRouteRepository`).
* Una clase por archivo, sufijo `Async` en métodos asíncronos y uso de inyección de dependencias.
* Organización por bounded context con capas `Domain`, `Application`, `Infrastructure` e `Interfaces` (controllers REST en plural, por ejemplo `/api/v1/return-routes`).
* Endpoints documentados con OpenAPI mediante Swagger.

**Gherkin**

Referencia: [Gherkin Conventions for Readable Specifications](https://specflow.org/gherkin/gherkin-conventions-for-readable-specifications/).

* Palabras clave `Feature`, `Scenario`, `Given`, `When`, `Then`, `And`.
* Un solo `When` por escenario y escenarios con nombres que describen el comportamiento esperado.
* Uso de `Examples` en tablas cuando un escenario se repite con distintos datos.

### 5.1.4. Software Deployment Configuration

La solución Trazza se compone de tres productos que se despliegan de forma independiente. La siguiente tabla resume la configuración vigente al Sprint 2.

| Producto | Repositorio / rama | Tecnología | Servicio de despliegue | URL pública |
| :--- | :--- | :--- | :--- | :--- |
| Landing Page | `Trazza-LandingPage` / `main` | HTML5, CSS3, JavaScript | AWS Amplify Hosting | [https://main.d3opwp5g5g1mc8.amplifyapp.com](https://main.d3opwp5g5g1mc8.amplifyapp.com) |
| Frontend Web Application | `Trazza-WebAplication` / `main` | Vue 3, Vite, PrimeVue, Pinia, Vue Router, Vue I18n | AWS Amplify Hosting | `[URL de Amplify de la Web Application]` |
| Fake API (temporal) | `Trazza-WebAplication` / `main` (carpeta `server`) | json-server | Render (Web Service) | `[URL de Render del Fake API]` |
| RESTful API (Sprint 3) | `Trazza-API` / `main` | ASP.NET Core, C#, EF Core | AWS EC2 | Pendiente |
| Base de datos (Sprint 3) | — | MySQL | AWS RDS for MySQL | Pendiente |

#### Landing Page (AWS Amplify Hosting)

1. Ingresar a la consola de AWS Amplify y seleccionar **Create new app → GitHub**.
2. Autorizar a AWS Amplify en la organización `StackRoot-1ASI0730-2620-8084` y seleccionar el repositorio `Trazza-LandingPage` y la rama `main`.
3. Al ser un sitio estático, no se configura comando de build y el directorio de salida es la raíz del repositorio (`/`).
4. Guardar y desplegar. Amplify publica el sitio en un dominio `*.amplifyapp.com` con HTTPS.
5. Cada merge en `main` dispara automáticamente un nuevo despliegue (despliegue continuo).

#### Frontend Web Application (AWS Amplify Hosting)

1. En AWS Amplify, crear una nueva app conectada al repositorio `Trazza-WebAplication`, rama `main`.
2. Configurar el build en `amplify.yml`:

```yaml
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: dist
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
```

3. Agregar la variable de entorno `VITE_API_BASE_URL` con la URL pública del Fake API (en el Sprint 3 se reemplazará por la URL de la RESTful API).
4. Agregar la regla Rewrites and redirects para que Vue Router funcione al recargar cualquier ruta:

| Source address | Target address | Type |
| :--- | :--- | :--- |
| `</^[^.]+$\|\.(?!(css\|gif\|ico\|jpg\|js\|png\|txt\|svg\|woff\|woff2\|ttf\|map\|json\|webp)$)([^.]+$)/>` | `/index.html` | `200 (Rewrite)` |

5. Guardar y desplegar. Cada merge en `main` genera un nuevo build y despliegue.

#### Fake API (Render)

1. Crear un **Web Service** en Render conectado al repositorio `Trazza-WebAplication`.
2. Configurar Root Directory `server`, Build Command `npm install` y Start Command `npx json-server db.json --host 0.0.0.0 --port $PORT`.
3. Copiar la URL pública generada y registrarla como `VITE_API_BASE_URL` en AWS Amplify.

#### RESTful API y base de datos (planificado para el Sprint 3)

1. Aprovisionar una instancia de AWS RDS for MySQL y restringir su Security Group para aceptar conexiones solo desde la instancia EC2 de la API.
2. Publicar el proyecto ASP.NET Core en modo `Release` (`dotnet publish -c Release`) y ejecutarlo en una instancia AWS EC2 detrás de Nginx como proxy inverso.
3. Configurar como variables de entorno `ASPNETCORE_ENVIRONMENT=Production`, la cadena de conexión a MySQL y la clave para la generación de tokens JWT, sin exponer credenciales en el repositorio.
4. Habilitar Swagger UI en `/swagger` como evidencia de la documentación OpenAPI.
