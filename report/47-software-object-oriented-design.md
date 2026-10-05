## 4.7. Software Object-Oriented Design

En esta sección se presenta el diseño orientado a objetos de Trazza, considerando los principios de Domain-Driven Design (DDD) definidos para la arquitectura del sistema. El diseño de clases representa las principales entidades, objetos de valor, servicios y componentes de las capas Domain, Application, Infrastructure y Presentation.

La estructura del diseño se organiza de acuerdo con los bounded contexts identificados para la plataforma: IAM & Profiles, Matchmaking & Routing, Service Execution & Monitoring, Payment & Billing y Loyalty & Reputation. Esta organización permite mantener separadas las responsabilidades de cada contexto y representar las relaciones existentes entre los principales elementos del dominio.

Asimismo, se presenta el Class Dictionary, donde se detallan los atributos, tipos de datos, métodos y responsabilidades de las principales clases del sistema.

### 4.7.1. Class Diagrams
![C4 Class Diagrams](../assets/images/chapter4/diagrams-v2/Class/class-diagram-general.png)

**IAM & Profiles** 
![C4 Class Diagrams-IAM & Profiles ](../assets/images/chapter4/diagrams-v2/SystemContext.png)
**Matchmaking & Routing** 
![C4 Class Diagrams-Matchmaking & Routing ](../assets/images/chapter4/diagrams-v2/SystemContext.png)
**Service Execution & Monitoring** 
![C4 Class Diagrams-Service Execution & Monitoring](../assets/images/chapter4/diagrams-v2/SystemContext.png)
**Payment & Billing**  
![C4 Class Diagrams-Payment & Billing](../assets/images/chapter4/diagrams-v2/SystemContext.png)
**Loyalty & Reputation**
![C4 Class Diagrams-Loyalty & Reputation](../assets/images/chapter4/diagrams-v2/SystemContext.png)
### 4.7.2. Class Dictionary