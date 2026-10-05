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
## 4.7.2. Class Dictionary

A continuación, se presenta el diccionario de clases de Trazza, organizado de acuerdo con los Bounded Contexts definidos en la arquitectura del sistema. Para cada clase se especifican sus principales atributos, tipos de datos, métodos y responsabilidades dentro de la aplicación.

### IAM & Profiles Bounded Context

#### User

Representa a un usuario registrado en la plataforma Trazza. Permite identificar al usuario y determinar el rol con el que interactúa dentro del sistema.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| email | String |
| role | UserRole |

| Método | Descripción |
|---|---|
| `constructor(id, email, role)` | Inicializa un usuario con su identificador, correo electrónico y rol dentro de la plataforma. |

#### UserRole

Enumeración que define los diferentes roles que puede asumir un usuario dentro de Trazza.

| Valor | Descripción |
|---|---|
| `CARRIER` | Identifica a un usuario que ofrece capacidad disponible para transportar cargas. |
| `MERCHANT` | Identifica a un emprendedor que necesita transportar mercadería. |
| `ADMIN` | Identifica a un usuario con privilegios administrativos dentro de la plataforma. |

#### CarrierProfile

Representa el perfil especializado de un transportista registrado en Trazza.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| userId | Number |
| fullName | String |
| dni | String |
| phone | String |
| identityValidated | Boolean |

| Método | Descripción |
|---|---|
| `constructor(id, userId, fullName, dni, phone, identityValidated)` | Inicializa el perfil de un transportista con su información personal y estado de validación de identidad. |

#### MerchantProfile

Representa el perfil de un emprendedor o empresa que utiliza Trazza para solicitar el transporte de mercadería.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| userId | Number |
| businessName | String |
| ruc | String |
| businessType | String |
| address | String |

| Método | Descripción |
|---|---|
| `constructor(id, userId, businessName, ruc, businessType, address)` | Inicializa el perfil del emprendedor con la información correspondiente a su negocio. |

#### Vehicle

Representa un vehículo registrado por un transportista para realizar servicios de transporte.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| carrierProfileId | Number |
| plate | String |
| model | String |
| capacityKg | Number |
| dimensions | String |

| Método | Descripción |
|---|---|
| `constructor(id, carrierProfileId, plate, model, capacityKg, dimensions)` | Inicializa un vehículo asociado al perfil de un transportista. |

#### SignInCommand

Representa la información necesaria para solicitar el inicio de sesión de un usuario.

| Atributo | Tipo |
|---|---|
| email | String |
| password | String |

| Método | Descripción |
|---|---|
| `constructor(email, password)` | Inicializa el comando con las credenciales necesarias para iniciar sesión. |

#### SignUpCommand

Representa la información requerida para registrar un nuevo usuario en Trazza.

| Atributo | Tipo |
|---|---|
| email | String |
| password | String |
| role | UserRole |

| Método | Descripción |
|---|---|
| `constructor(email, password, role)` | Inicializa el comando utilizado para registrar un nuevo usuario y asignarle un rol. |

#### IamStore

Gestiona el estado relacionado con autenticación, perfiles y vehículos dentro de la aplicación web.

| Atributo | Tipo |
|---|---|
| currentUser | User \| null |
| carrierProfile | CarrierProfile \| null |
| merchantProfile | MerchantProfile \| null |
| vehicles | Vehicle[] |
| errors | Any[] |
| isSignedIn | Boolean |
| currentToken | Computed |
| currentRole | Computed |

| Método | Descripción |
|---|---|
| `signIn(signInCommand, router)` | Inicia sesión utilizando las credenciales proporcionadas. |
| `signUp(signUpCommand, router)` | Registra un nuevo usuario en la plataforma. |
| `signOut()` | Finaliza la sesión del usuario actual. |
| `fetchProfile()` | Obtiene el perfil asociado al usuario autenticado. |
| `updateProfile(profile)` | Actualiza la información del perfil del usuario. |
| `fetchVehicles()` | Obtiene los vehículos registrados por el transportista. |
| `addVehicle(vehicle)` | Registra un nuevo vehículo. |
| `validateIdentity(document)` | Solicita la validación de identidad del transportista. |

---

### Matchmaking & Routing Bounded Context

#### Location

Value Object que representa una ubicación geográfica utilizada como origen o destino de una ruta o envío.

| Atributo | Tipo |
|---|---|
| address | String |
| latitude | Number |
| longitude | Number |

| Método | Descripción |
|---|---|
| `constructor(address, latitude, longitude)` | Inicializa una ubicación mediante una dirección y sus coordenadas geográficas. |

#### ReturnRoute

Representa una ruta de retorno publicada por un transportista que dispone de capacidad libre para transportar mercadería.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| carrierProfileId | Number |
| vehicleId | Number |
| origin | Location |
| destination | Location |
| availableCapacityKg | Number |
| departureDate | Date |
| status | String |

| Método | Descripción |
|---|---|
| `constructor(id, carrierProfileId, vehicleId, origin, destination, availableCapacityKg, departureDate, status)` | Inicializa una ruta de retorno indicando transportista, vehículo, origen, destino, capacidad disponible y fecha de salida. |

#### ShipmentRequest

Representa una solicitud publicada por un emprendedor para transportar una determinada carga.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| merchantProfileId | Number |
| description | String |
| weightKg | Number |
| origin | Location |
| destination | Location |
| status | String |

| Método | Descripción |
|---|---|
| `constructor(id, merchantProfileId, description, weightKg, origin, destination, status)` | Inicializa una solicitud de envío con la información de la carga, peso, origen y destino. |

#### MatchProposal

Representa una propuesta que relaciona una solicitud de envío con una ruta de retorno compatible y permite establecer una tarifa para el servicio.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| shipmentRequestId | Number |
| returnRouteId | Number |
| proposedRate | Number |
| status | String |

| Método | Descripción |
|---|---|
| `constructor(id, shipmentRequestId, returnRouteId, proposedRate, status)` | Inicializa una propuesta de coincidencia entre una solicitud de envío y una ruta de retorno. |

#### Message

Representa un mensaje enviado durante la comunicación o negociación asociada a una propuesta.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| matchProposalId | Number |
| senderUserId | Number |
| content | String |
| sentAt | Date |

| Método | Descripción |
|---|---|
| `constructor(id, matchProposalId, senderUserId, content, sentAt)` | Inicializa un mensaje asociado a una propuesta y al usuario que lo envía. |

#### PublishReturnRouteCommand

Contiene los datos necesarios para publicar una nueva ruta de retorno.

| Atributo | Tipo |
|---|---|
| vehicleId | Number |
| origin | Location |
| destination | Location |
| availableCapacityKg | Number |
| departureDate | Date |

#### CreateShipmentRequestCommand

Contiene la información necesaria para crear una solicitud de envío.

| Atributo | Tipo |
|---|---|
| description | String |
| weightKg | Number |
| origin | Location |
| destination | Location |

#### ProposeRateCommand

Representa una solicitud para establecer o modificar la tarifa de una propuesta de transporte.

| Atributo | Tipo |
|---|---|
| matchProposalId | Number |
| proposedRate | Number |

#### MatchmakingStore

Gestiona el estado y las operaciones correspondientes al proceso de búsqueda, matching, propuestas y negociación.

| Atributo | Tipo |
|---|---|
| returnRoutes | ReturnRoute[] |
| shipmentRequests | ShipmentRequest[] |
| suggestedLoads | ShipmentRequest[] |
| searchResults | ReturnRoute[] |
| proposals | MatchProposal[] |
| messages | Message[] |
| errors | Any[] |

| Método | Descripción |
|---|---|
| `publishReturnRoute(command)` | Publica una nueva ruta de retorno. |
| `searchReturnRoutes(origin, destination, date)` | Busca rutas disponibles utilizando origen, destino y fecha. |
| `createShipmentRequest(command)` | Registra una nueva solicitud de envío. |
| `cancelShipmentRequest(request)` | Cancela una solicitud de envío existente. |
| `fetchSuggestedLoads(returnRouteId)` | Obtiene cargas compatibles con una ruta de retorno. |
| `acceptLoad(request)` | Acepta una carga para iniciar el proceso de negociación. |
| `proposeRate(command)` | Registra una tarifa propuesta para el servicio. |
| `respondToProposal(proposal, accepted)` | Permite aceptar o rechazar una propuesta. |
| `fetchMessages(proposalId)` | Recupera los mensajes relacionados con una propuesta. |
| `sendMessage(message)` | Envía un mensaje dentro de una negociación. |

#### MatchmakingEngine

Servicio de dominio encargado de determinar la compatibilidad entre rutas de retorno y solicitudes de envío.

| Método | Descripción |
|---|---|
| `findMatches(returnRoute, shipmentRequests)` | Evalúa las solicitudes disponibles y obtiene aquellas compatibles con una ruta de retorno. |
| `calculateCompatibility(returnRoute, shipmentRequest)` | Determina el nivel de compatibilidad entre una ruta y una solicitud considerando las restricciones del servicio. |

#### RouteOptimizationService

Servicio de dominio responsable de apoyar la optimización de las rutas utilizadas durante el proceso de matching.

| Método | Descripción |
|---|---|
| `calculateOptimalRoute(origin, destination)` | Calcula una ruta apropiada entre el origen y destino establecidos. |
| `calculateCostMatrix(locations)` | Construye una matriz de costos entre las ubicaciones utilizadas durante el cálculo de rutas. |

---

### Service Execution & Monitoring Bounded Context

#### Trip

Representa la ejecución de un servicio logístico generado a partir de una propuesta aceptada.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| matchProposalId | Number |
| status | TripStatus |
| pickedUpAt | Date \| null |
| deliveredAt | Date \| null |

| Método | Descripción |
|---|---|
| `constructor(id, matchProposalId, status, pickedUpAt, deliveredAt)` | Inicializa un viaje asociado a una propuesta aceptada. |

#### TripStatus

Enumeración que representa los posibles estados de ejecución de un viaje.

| Valor | Descripción |
|---|---|
| `AGREED` | El servicio de transporte fue acordado entre ambas partes. |
| `PICKED_UP` | La mercadería fue recogida por el transportista. |
| `IN_TRANSIT` | La mercadería se encuentra en proceso de transporte. |
| `DELIVERED` | La entrega de la mercadería fue confirmada. |
| `COMPLETED` | El servicio logístico fue completado. |
| `CANCELLED` | El viaje fue cancelado. |

#### TrackingPoint

Value Object que representa una posición geográfica registrada durante el seguimiento de un viaje.

| Atributo | Tipo |
|---|---|
| tripId | Number |
| latitude | Number |
| longitude | Number |
| recordedAt | Date |

| Método | Descripción |
|---|---|
| `constructor(tripId, latitude, longitude, recordedAt)` | Inicializa un punto de seguimiento asociado a un viaje. |

#### DeviationAlert

Representa una alerta generada cuando el sistema detecta una desviación respecto a la ruta planificada.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| tripId | Number |
| deviationKm | Number |
| detectedAt | Date |

| Método | Descripción |
|---|---|
| `constructor(id, tripId, deviationKm, detectedAt)` | Inicializa una alerta de desviación asociada a un viaje. |

#### Incident

Representa una incidencia reportada durante la ejecución de un servicio de transporte.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| tripId | Number |
| description | String |
| status | String |
| reportedAt | Date |

| Método | Descripción |
|---|---|
| `constructor(id, tripId, description, status, reportedAt)` | Inicializa una incidencia vinculada a un viaje. |

#### ConfirmPickupCommand

Representa la acción mediante la cual se confirma la recolección de la mercadería.

| Atributo | Tipo |
|---|---|
| tripId | Number |

#### ConfirmDeliveryCommand

Representa la acción mediante la cual se confirma la entrega de la mercadería.

| Atributo | Tipo |
|---|---|
| tripId | Number |

#### ReportIncidentCommand

Contiene los datos necesarios para registrar una incidencia ocurrida durante un viaje.

| Atributo | Tipo |
|---|---|
| tripId | Number |
| description | String |

#### MonitoringStore

Gestiona el estado de los viajes, seguimiento geográfico, alertas e incidencias.

| Atributo | Tipo |
|---|---|
| trips | Trip[] |
| currentLocation | TrackingPoint \| null |
| alerts | DeviationAlert[] |
| incidents | Incident[] |
| errors | Any[] |
| completedTrips | Computed |

| Método | Descripción |
|---|---|
| `fetchTrips()` | Obtiene los viajes relacionados con el usuario. |
| `getTripById(id)` | Recupera un viaje específico mediante su identificador. |
| `confirmPickup(command)` | Confirma que la mercadería fue recogida. |
| `confirmDelivery(command)` | Confirma que la mercadería fue entregada. |
| `startLocationSharing(tripId)` | Inicia el envío periódico de la ubicación durante un viaje. |
| `stopLocationSharing()` | Detiene el envío de la ubicación. |
| `refreshLocation(tripId)` | Actualiza la ubicación conocida del vehículo. |
| `fetchAlerts(tripId)` | Obtiene las alertas de desviación relacionadas con un viaje. |
| `reportIncident(command)` | Registra una incidencia durante la ejecución del servicio. |

---

### Payment & Billing Bounded Context

#### PaymentTransaction

Representa una transacción de pago asociada a un viaje completado o cuya entrega ha sido confirmada. Mantiene el importe, participantes y estado del procesamiento realizado mediante la pasarela de pago.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| tripId | Number |
| payerUserId | Number |
| payeeUserId | Number |
| amount | Decimal |
| currency | String |
| paymentMethod | PaymentMethod |
| status | PaymentStatus |
| externalTransactionId | String \| null |
| createdAt | Date |
| paidAt | Date \| null |

| Método | Descripción |
|---|---|
| `constructor(id, tripId, payerUserId, payeeUserId, amount, currency, paymentMethod, status)` | Inicializa una transacción de pago asociada a un viaje. |
| `markAsProcessing()` | Cambia el estado de la transacción para indicar que el pago está siendo procesado. |
| `markAsPaid(externalTransactionId)` | Registra la transacción como pagada y almacena el identificador generado por la pasarela de pago. |
| `markAsFailed()` | Registra la transacción como fallida cuando el procesamiento del pago no puede completarse. |

#### PaymentStatus

Enumeración que representa los estados posibles de una transacción de pago.

| Valor | Descripción |
|---|---|
| `PENDING` | El pago fue creado pero todavía no ha comenzado a procesarse. |
| `PROCESSING` | La transacción se encuentra siendo procesada por la pasarela de pago. |
| `PAID` | El pago fue confirmado satisfactoriamente. |
| `FAILED` | La operación de pago no pudo completarse. |
| `REFUNDED` | El importe de una transacción previamente pagada fue devuelto. |

#### PaymentMethod

Enumeración que representa los métodos de pago admitidos por la plataforma.

| Valor | Descripción |
|---|---|
| `CARD` | El pago se realiza utilizando una tarjeta. |
| `DIGITAL_WALLET` | El pago se realiza mediante una billetera digital compatible con la pasarela de pago. |

#### Receipt

Representa el comprobante generado como resultado de una transacción de pago.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| paymentTransactionId | Number |
| receiptNumber | String |
| issuedAt | Date |
| status | String |
| externalReceiptId | String \| null |

| Método | Descripción |
|---|---|
| `constructor(id, paymentTransactionId, receiptNumber, issuedAt, status)` | Inicializa un comprobante asociado a una transacción de pago. |

#### CreatePaymentCommand

Contiene la información necesaria para iniciar una operación de pago correspondiente a un viaje.

| Atributo | Tipo |
|---|---|
| tripId | Number |
| paymentMethod | PaymentMethod |
| paymentToken | String |

#### PaymentStore

Gestiona el estado de los pagos y comprobantes dentro de la aplicación web.

| Atributo | Tipo |
|---|---|
| payments | PaymentTransaction[] |
| currentPayment | PaymentTransaction \| null |
| receipts | Receipt[] |
| errors | Any[] |

| Método | Descripción |
|---|---|
| `createPayment(command)` | Inicia una nueva operación de pago. |
| `fetchPayment(id)` | Recupera una transacción de pago mediante su identificador. |
| `fetchPayments()` | Obtiene el historial de pagos correspondiente al usuario. |
| `fetchReceipt(paymentId)` | Obtiene el comprobante asociado a una determinada transacción. |
| `refreshPaymentStatus(id)` | Actualiza el estado de una transacción consultando la información disponible en el backend. |

---

### Loyalty & Reputation Bounded Context

#### Rating

Representa la calificación realizada por un usuario hacia otro después de completar un servicio logístico.

| Atributo | Tipo |
|---|---|
| id | Number \| null |
| tripId | Number |
| raterUserId | Number |
| ratedUserId | Number |
| score | Number |
| comment | String |
| createdAt | Date |

| Método | Descripción |
|---|---|
| `constructor(id, tripId, raterUserId, ratedUserId, score, comment, createdAt)` | Inicializa una calificación asociada a un viaje, al usuario que califica y al usuario calificado. |

#### ReputationSummary

Value Object que representa el resumen de reputación obtenido a partir de las calificaciones recibidas por un usuario.

| Atributo | Tipo |
|---|---|
| userId | Number |
| averageScore | Number |
| ratingsCount | Number |

| Método | Descripción |
|---|---|
| `constructor(userId, averageScore, ratingsCount)` | Inicializa el resumen de reputación de un usuario. |

#### SubmitRatingCommand

Contiene la información requerida para registrar una nueva calificación después de completar un viaje.

| Atributo | Tipo |
|---|---|
| tripId | Number |
| ratedUserId | Number |
| score | Number |
| comment | String |

#### ReputationStore

Gestiona las calificaciones y los resúmenes de reputación utilizados en la aplicación.

| Atributo | Tipo |
|---|---|
| ratings | Rating[] |
| summaries | ReputationSummary[] |
| errors | Any[] |

| Método | Descripción |
|---|---|
| `submitRating(command)` | Registra una nueva calificación para un usuario. |
| `fetchRatings(userId)` | Obtiene las calificaciones recibidas por un usuario. |
| `fetchSummary(userId)` | Obtiene el resumen de reputación correspondiente a un usuario. |

---

### Shared Bounded Context

#### BaseApi

Proporciona la configuración HTTP común utilizada por los diferentes servicios de infraestructura para comunicarse con la API de Trazza.

| Atributo | Tipo |
|---|---|
| http | AxiosInstance |

| Método | Descripción |
|---|---|
| `constructor()` | Inicializa la configuración base utilizada para realizar solicitudes HTTP. |
| `get http()` | Devuelve la instancia HTTP configurada para comunicarse con la API. |

#### BaseEndpoint

Proporciona operaciones HTTP reutilizables para los diferentes endpoints consumidos por la aplicación.

| Atributo | Tipo |
|---|---|
| http | AxiosInstance |
| endpointPath | String |

| Método | Descripción |
|---|---|
| `constructor(baseApi, endpointPath)` | Inicializa un endpoint utilizando la configuración HTTP y su ruta correspondiente. |
| `getAll()` | Recupera todos los recursos disponibles en el endpoint. |
| `getById(id)` | Recupera un recurso mediante su identificador. |
| `create(resource)` | Envía un nuevo recurso para su creación. |
| `update(id, resource)` | Actualiza un recurso existente. |
| `delete(id)` | Solicita la eliminación de un recurso mediante su identificador. |

#### GeolocationService

Servicio compartido encargado de obtener y supervisar la ubicación geográfica proporcionada por el navegador del usuario.

| Método | Descripción |
|---|---|
| `getCurrentPosition()` | Obtiene la posición geográfica actual del dispositivo. |
| `watchPosition(callback)` | Inicia el seguimiento continuo de la ubicación y ejecuta una función cuando esta cambia. |
| `clearWatch(watchId)` | Detiene un proceso de seguimiento de ubicación previamente iniciado. |