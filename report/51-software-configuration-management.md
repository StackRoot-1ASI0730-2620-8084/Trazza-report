# 5.1. Software Configuration Management

En esta sección se establecen las decisiones, herramientas y convenciones tecnológicas que permitirán mantener la consistencia y calidad durante todo el ciclo de vida del proyecto Trazza.

## 5.1.1. Software Development Environment Configuration

Para el desarrollo colaborativo del ciclo de vida del producto digital, el equipo ha estandarizado el uso de las siguientes herramientas y plataformas, adaptadas al stack tecnológico de Vue y ASP.NET Core.

| Categoría | Producto | Propósito en el Proyecto | Referencia / Descarga |
| :--- | :--- | :--- | :--- |
| **Project & Requirements Management** | JetBrains YouTrack | Gestión del Product Backlog, Sprints, User Stories y seguimiento de tareas ágiles. | [youtrack.jetbrains.com](https://youtrack.jetbrains.com/) |
| **Product UX/UI Design** | Figma / FigJam | Creación de Wireframes, Mock-ups, prototipos interactivos y diagramas de flujo. | [figma.com](https://www.figma.com/) |
| **Domain & Architecture Design** | Miro / PlantUML | Diagramación de Event Storming y Modelado C4 como código (Diagram-as-Code). | [miro.com](https://miro.com/) / [plantuml.com](https://plantuml.com/) |
| **Software Development (Frontend)** | JetBrains WebStorm / VS Code | IDE para el desarrollo del Landing Page y la Frontend Web Application en Vue/JavaScript. | [jetbrains.com/webstorm](https://www.jetbrains.com/webstorm/) |
| **Software Development (Backend)** | Visual Studio 2022 / Rider | IDE principal para la construcción del RESTful API utilizando C# y ASP.NET Core. | [visualstudio.microsoft.com](https://visualstudio.microsoft.com/) |
| **Database Management** | DBeaver | Administración, diseño y ejecución de consultas directas en la base de datos MySQL. | [dbeaver.io](https://dbeaver.io/) |
| **API Testing & Docs** | Swagger UI | Documentación basada en OpenAPI Specification y pruebas de endpoints REST. | [swagger.io](https://swagger.io/) |
| **Software Deployment (Cloud)** | Amazon Web Services (AWS) | Infraestructura Cloud (Amplify, EC2, RDS) para el despliegue continuo en producción. | [aws.amazon.com](https://aws.amazon.com/) |

## 5.1.2. Source Code Management

El equipo utiliza **GitHub** como plataforma centralizada para el alojamiento y control de versiones del código fuente, organizado dentro de la organización `StackRoot-1ASI0730-2620-8084` mediante repositorios separados por componentes:

* **Informe del Proyecto:** [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-report)
* **Landing Page Repository:** [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-LandingPage](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-LandingPage)
* **Frontend Web Application Repository:** [https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-WebAplication](https://github.com/StackRoot-1ASI0730-2620-8084/Trazza-WebAplication)

**Flujo de Trabajo: GitFlow Workflow**

El ciclo de vida del código se rige estrictamente por el modelo de ramificación GitFlow de Vincent Driessen, aislando el trabajo en progreso de las versiones estables:
* `main`: Rama principal que contiene exclusivamente código estable y desplegado en producción.
* `develop`: Rama de integración donde se agrupa el código funcional antes de un lanzamiento.
* `feature/nombre-de-la-funcionalidad`: Ramas temporales creadas a partir de `develop` para desarrollar User Stories específicas (ej. `feature/US01-registro-transportista`).
* `release/vX.X.X`: Ramas de preparación para el pase a producción, usadas para pruebas finales y corrección de bugs menores.
* `hotfix/nombre-del-error`: Ramas creadas directamente desde `main` para parchar errores críticos en producción.

**Versionamiento y Convenciones de Commits**

* **Semantic Versioning (SemVer 2.0.0):** Los releases se etiquetarán bajo el formato `vX.Y.Z` (Major.Minor.Patch). Un cambio de *Major* indica incompatibilidad de API, *Minor* añade funcionalidad compatible hacia atrás, y *Patch* aplica correcciones de errores.
* **Conventional Commits:** Todos los mensajes de confirmación respetarán esta semántica:
  * `feat:` para nuevas características (User Stories).
  * `fix:` para solución de errores (bugs).
  * `docs:` para actualizaciones en la documentación o diagramas.
  * `refactor:` para mejoras estructurales de código sin cambiar funcionalidad.

## 5.1.3. Source Code Style Guide & Coding Conventions

Para garantizar la mantenibilidad y legibilidad del código base, el equipo adoptará de manera estricta el idioma **inglés** para la nomenclatura de variables, clases, métodos, esquemas de bases de datos y mensajes de commits. Además, el proyecto se regirá por los siguientes estándares de la industria:

* **Landing Page (HTML/CSS):** Se aplicarán las guías de **W3C Standards** y **Google HTML/CSS Style Guide** para estructuración semántica, indentación a 2 espacios y convenciones de nomenclatura con guiones (kebab-case) para IDs y clases.
* **Frontend Web Application (Vue & JavaScript):** Se seguirá estrictamente la **Vue Style Guide** oficial para la estructura de Single-File Components (SFCs), así como la **W3C JavaScript Style Guide** para lógica del lado del cliente, garantizando el uso consistente de ES6+ (let, const, arrow functions).
* **Backend API Application (C# & ASP.NET Core):** Toda la lógica de lado del servidor respetará las **C# Coding Conventions** de Microsoft, utilizando PascalCase para Clases y Métodos, camelCase para variables locales, y el prefijo `I` para Interfaces. La estructura arquitectónica se basará en las guías de **Microsoft ASP.NET Core Guidelines** para inyección de dependencias estandarizada, uso de DTOs y manejo asíncrono.

## 5.1.4. Software Deployment Configuration

La plataforma Trazza operará sobre una arquitectura de nube escalable soportada integralmente por los servicios de **Amazon Web Services (AWS)**. La configuración de despliegue se ha diseñado para separar las responsabilidades del frontend estático, el procesamiento del backend y la persistencia de datos:

1. **Landing Page y Frontend Web Application (AWS Amplify):**
   * **Proceso:** Los repositorios `Trazza-LandingPage` y `Trazza-WebAplication` se vincularán directamente a AWS Amplify.
   * **Despliegue Continuo (CI/CD):** Al realizar un merge hacia la rama `main` en GitHub, Amplify detectará el cambio automáticamente, ejecutará el proceso de *build* correspondiente, optimizará los *assets* estáticos y desplegará la nueva versión a través de la red global de entrega de contenido (CDN) de AWS.
2. **API Application / Web Services (AWS EC2):**
   * **Proceso:** El backend desarrollado en ASP.NET Core se alojará en instancias de máquinas virtuales Elastic Compute Cloud (EC2).
   * **Configuración:** El código se compilará en modo `Release`. La instancia de EC2 ejecutará el servicio detrás de un proxy inverso para mapear los puertos internos al puerto público, habilitando los endpoints RESTful para su consumo externo.
3. **Relational Database (AWS RDS):**
   * **Proceso:** La base de datos relacional MySQL se aprovisionará utilizando Amazon Relational Database Service (RDS).
   * **Configuración:** Se configurará el Security Group en AWS RDS para permitir conexiones entrantes únicamente desde la instancia EC2, garantizando la protección de los datos transaccionales. La API conectará a esta instancia mediante un *Connection String* seguro.
