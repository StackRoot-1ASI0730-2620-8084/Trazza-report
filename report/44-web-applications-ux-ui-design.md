## 4.4. Web Applications UX/UI Design.

El diseño de la experiencia de usuario (UX) y de la interfaz (UI) de la Web Application de **Trazza** se ha centrado en tareas cortas y frecuentes. El transportista (Carrier) utiliza la aplicación principalmente desde su celular, entre una entrega y otra, para publicar su ruta de retorno y conseguir una carga compatible; el emprendedor MYPE (Merchant) la utiliza desde la computadora de su negocio o desde el celular para solicitar fletes, elegir un transportista confiable y seguir su envío. Por ello, cada vista tiene una sola acción principal claramente visible, la información necesaria para decidir (desvío, tarifa ofrecida y reputación) aparece sin necesidad de abrir el detalle, y el estado de cada viaje o envío se comunica mediante un stepper (Matched → Picked up → In transit → Delivered).

La UI se basa en Material Design y se implementa con PrimeVue, aplicando el Design System de la startup definido en la sección 4.1: tipografía Plus Jakarta Sans, color primario `#0037B0`, texto `#131B2E`, verde `#006C4A` para estados completados y tarifas, y ámbar para alertas de desvío. La experiencia es responsive (Desktop 1280 px y Mobile 390 px), el idioma por defecto es inglés con soporte para español latinoamericano (i18n), y los estados nunca se comunican solo con color, sino también con texto e íconos (a11y).

Los diseños se organizan según los **User Goals** de los dos User Personas:

| User Goal | User Persona | User Stories relacionadas |
|---|---|---|
| UG0. Acceder a la plataforma (registro e inicio de sesión) | Juan David Ramos (Carrier) / Valeria Torres (Merchant) | US01, US02, US03 |
| UG1. Publicar una ruta de retorno y asegurar una carga compatible | Juan David Ramos (Carrier) | US08, US10, US12, US13 |
| UG2. Ejecutar un viaje desde el recojo hasta la entrega | Juan David Ramos (Carrier) | US16, US17, US18, US20, US24 |
| UG3. Solicitar un flete y cerrar un acuerdo con un transportista | Valeria Torres (Merchant) | US09, US11, US13 |
| UG4. Seguir un envío y confirmar su entrega | Valeria Torres (Merchant) | US15, US19, US21, US29, US30, US31 |
| UG5. Gestionar vehículos y suscripción | Ambos | US23, Plan & Billing |

---

### 4.4.1. Web Applications Wireframes.

En esta sección se presentan los wireframes de la Web Application de Trazza para **Desktop Web Browser (1280 px)** y **Mobile Web Browser (390 px)**, elaborados en Figma. Estos modelos de baja fidelidad establecen la arquitectura de la información, la jerarquía visual y la ubicación de las acciones principales de cada vista, sin la distracción del color ni de los elementos gráficos finales. Se incluyen también los estados alternativos (errores de validación, estados vacíos y diálogos de advertencia), que luego se utilizan en los wireflows y user flows. En la versión mobile, el sidebar se reemplaza por un menú tipo drawer, los formularios pasan a una sola columna, las tablas se convierten en cards, los diálogos se muestran como bottom sheets y las acciones principales ocupan todo el ancho con un área táctil mínima de 44 px.

#### User Goal 0: Acceso a la plataforma

Permitir que transportistas y emprendedores se registren eligiendo su rol e inicien sesión de forma segura.

La arquitectura de información sigue un modelo lineal que guía al usuario paso a paso. En el registro, el rol (Carrier o Merchant) aparece primero y viene preseleccionado desde el CTA del Landing Page ("I'm a Carrier" / "I'm a Merchant"), de modo que la experiencia es consistente entre ambos productos. Los campos obligatorios se marcan con asterisco, y los errores se muestran debajo del campo con ícono y texto, sin depender solo del color.

**Pantallas de flujo**

* **Sign in:** formulario de correo y contraseña, con enlace para recuperar la contraseña y acceso al registro de cada segmento.
* **Sign up:** selección del rol, datos personales, DNI (Carrier) o RUC (Merchant), contraseña y aceptación de los Terms & Conditions.
* **Unhappy path:** correo ya registrado, con el mensaje de error debajo del campo.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-sign-up-1.png" alt="Wireframe Desktop – wireframe desk sign up 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-sign-up-2.png" alt="Wireframe Desktop – wireframe desk sign up 2" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-auth-sign-in-1.png" alt="Wireframe Mobile – wireframe mobile auth sign in 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-auth-sign-up-1.png" alt="Wireframe Mobile – wireframe mobile auth sign up 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-carrier-menu-1.png" alt="Wireframe Mobile – wireframe mobile carrier menu 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-merchant-menu-1.png" alt="Wireframe Mobile – wireframe mobile merchant menu 1" width="300">
</div>

#### User Goal 1: Publicar una ruta de retorno y asegurar una carga compatible

Permitir que el transportista publique su viaje de regreso y encuentre una carga que encaje con su ruta y su capacidad, para no regresar vacío.

El Dashboard del transportista prioriza su próximo viaje de retorno y las nuevas sugerencias de carga; la acción principal "Publish return route" está siempre visible. El formulario de publicación sigue un orden secuencial (origen → destino → horario → vehículo → capacidad → desvío máximo) que refleja la forma en que el transportista piensa su viaje. En Load Suggestions se aplica el principio de proximidad: cada card agrupa ruta, peso, desvío y tarifa ofrecida, de modo que el usuario puede decidir sin abrir el detalle. En el detalle de la carga, el panel de decisión (aceptar, contraofertar o rechazar) se diferencia con un borde destacado, y el teléfono del emprendedor solo se muestra después de confirmar el match, para que el acuerdo se mantenga dentro de Trazza.

**Pantallas de flujo**

* **Carrier Dashboard:** resumen con KPIs, próximo viaje de retorno y nuevas sugerencias de carga.
* **Publish Return Route:** formulario de la ruta de retorno con vista previa del recorrido.
* **Publish Return Route – error:** la capacidad ingresada supera la del vehículo; error en línea y botón deshabilitado.
* **Load Suggestions:** cargas compatibles ordenadas por menor desvío, junto al mapa.
* **Load Suggestions – empty state:** no hay cargas compatibles; se invita a editar la ruta y se notificará después.
* **Load Detail and Offer:** detalle de la carga, reputación del emprendedor, desvío y tarifa; opción de aceptar o contraofertar.
* **Load Detail – offer sent:** nuevo estado tras aceptar, a la espera de la confirmación del emprendedor.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-carrier-dashboard.png" alt="Wireframe Desktop – wireframe desk carrier dashboard" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-publish-return-route.png" alt="Wireframe Desktop – wireframe desk publish return route" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-publish-return-route-error.png" alt="Wireframe Desktop – wireframe desk publish return route error" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-load-suggestions.png" alt="Wireframe Desktop – wireframe desk load suggestions" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-load-suggestions-empty.png" alt="Wireframe Desktop – wireframe desk load suggestions empty" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-load-detail-and-offer.png" alt="Wireframe Desktop – wireframe desk load detail and offer" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-load-detail-offer-sent.png" alt="Wireframe Desktop – wireframe desk load detail offer sent" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-carrier-dashboard-1.png" alt="Wireframe Mobile – wireframe mobile carrier dashboard 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-return-routes-1.png" alt="Wireframe Mobile – wireframe mobile return routes 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-return-routes-2.png" alt="Wireframe Mobile – wireframe mobile return routes 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-load-suggestions-1.png" alt="Wireframe Mobile – wireframe mobile load suggestions 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-load-suggestions-2.png" alt="Wireframe Mobile – wireframe mobile load suggestions 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-load-offers-1.png" alt="Wireframe Mobile – wireframe mobile load offers 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-load-offers-2.png" alt="Wireframe Mobile – wireframe mobile load offers 2" width="300">
</div>

#### User Goal 2: Ejecutar un viaje desde el recojo hasta la entrega

Permitir que el transportista confirme el recojo y la entrega desde la aplicación, para que el emprendedor pueda seguir el viaje y el transportista construya su reputación.

La vista Active Trip se organiza alrededor de un stepper de cuatro estados, y en cada estado existe una sola acción principal ("Confirm pickup" o "Confirm delivery"), lo que reduce la carga cognitiva mientras el transportista está en ruta. El mapa ocupa la mayor parte de la pantalla y el panel lateral muestra solo la información del siguiente punto. Para prevenir errores, si el transportista confirma la entrega lejos del destino, el sistema muestra una advertencia antes de registrar la acción. Al finalizar, un diálogo permite calificar al emprendedor una sola vez por viaje.

**Pantallas de flujo**

* **Active Trip – matched:** viaje confirmado; la acción principal es "Confirm pickup".
* **Active Trip – in transit:** ubicación compartida desde el celular, hora estimada de llegada y "Confirm delivery".
* **Active Trip – far from destination:** advertencia cuando el transportista está a más de 1 km del punto de entrega.
* **Rate Merchant:** diálogo para calificar al emprendedor (1 a 5 estrellas, etiquetas y comentario).
* **Trip History:** historial cronológico de viajes con búsqueda y filtros por fecha y estado.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-active-trip-matched.png" alt="Wireframe Desktop – wireframe desk active trip matched" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-active-trip-in-transit.png" alt="Wireframe Desktop – wireframe desk active trip in transit" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-active-trip-far-from-destination.png" alt="Wireframe Desktop – wireframe desk active trip far from destination" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-rate-merchant.png" alt="Wireframe Desktop – wireframe desk rate merchant" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-trip-history.png" alt="Wireframe Desktop – wireframe desk trip history" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-active-trip-1.png" alt="Wireframe Mobile – wireframe mobile active trip 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-active-trip-2.png" alt="Wireframe Mobile – wireframe mobile active trip 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-active-trip-3.png" alt="Wireframe Mobile – wireframe mobile active trip 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-active-trip-4.png" alt="Wireframe Mobile – wireframe mobile active trip 4" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-trip-history-1.png" alt="Wireframe Mobile – wireframe mobile trip history 1" width="300">
</div>

#### User Goal 3: Solicitar un flete y cerrar un acuerdo con un transportista

Permitir que el emprendedor publique su solicitud de flete, encuentre transportistas que ya van hacia su destino y acuerde la tarifa dentro de la plataforma.

El Dashboard del emprendedor destaca el envío en tránsito y las solicitudes abiertas, con la acción principal "New freight request". El formulario agrupa la información en bloques (direcciones, horario, carga y tarifa opcional) y valida en línea los campos obligatorios. En Find Carriers, cada transportista se presenta con su calificación, verificación de DNI, capacidad libre y el desvío que implica su carga. La vista Offers centraliza las respuestas de los transportistas en una tabla con estados (Accepted, Counteroffer, Pending), reemplazando la coordinación por WhatsApp con oferta y contraoferta dentro de Trazza.

**Pantallas de flujo**

* **Merchant Dashboard:** envío en tránsito, KPIs y solicitudes de flete abiertas.
* **New Freight Request:** formulario de la solicitud con mapa y resumen.
* **New Freight Request – error:** campo obligatorio vacío; la solicitud no se publica.
* **Find Carriers:** transportistas con espacio libre en la ruta, con filtros por vehículo, capacidad y calificación.
* **Offers:** ofertas y contraofertas de cada transportista, con panel para contraofertar.
* **Offers – match confirmed:** nuevo estado tras confirmar el match; las demás ofertas se cierran.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-merchant-dashboard.png" alt="Wireframe Desktop – wireframe desk merchant dashboard" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-new-freight-request.png" alt="Wireframe Desktop – wireframe desk new freight request" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-new-freight-request-error.png" alt="Wireframe Desktop – wireframe desk new freight request error" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-find-carriers.png" alt="Wireframe Desktop – wireframe desk find carriers" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-offers.png" alt="Wireframe Desktop – wireframe desk offers" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-offers-match-confirmed.png" alt="Wireframe Desktop – wireframe desk offers match confirmed" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-merchant-dashboard-1.png" alt="Wireframe Mobile – wireframe mobile merchant dashboard 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-freight-requests-1.png" alt="Wireframe Mobile – wireframe mobile freight requests 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-freight-requests-2.png" alt="Wireframe Mobile – wireframe mobile freight requests 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-find-carriers-1.png" alt="Wireframe Mobile – wireframe mobile find carriers 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-freight-offers-1.png" alt="Wireframe Mobile – wireframe mobile freight offers 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-freight-offers-2.png" alt="Wireframe Mobile – wireframe mobile freight offers 2" width="300">
</div>

#### User Goal 4: Seguir un envío y confirmar su entrega

Permitir que el emprendedor siga su envío en tiempo real, reciba alertas si el vehículo se desvía y confirme que la mercadería llegó en buen estado.

En Shipment Tracking, la alerta de desvío aparece fija en la parte superior con ícono, texto y color de advertencia, de modo que es perceptible incluso para usuarios con dificultades para distinguir colores. El mapa muestra la ruta planificada con línea punteada y la posición actual del vehículo, y el panel lateral incluye la tarjeta del transportista, una línea de tiempo y el enlace de seguimiento de solo lectura para el cliente final. La confirmación de entrega se resuelve con un diálogo de dos opciones claras ("Yes, confirm delivery" / "No, report an incident"), y el reporte de incidencias permite adjuntar fotos dentro de las 48 horas posteriores a la entrega.

**Pantallas de flujo**

* **Shipment Tracking:** mapa en vivo, alerta de desvío mayor a 2 km, línea de tiempo y enlace para compartir.
* **Confirm Delivery:** diálogo para confirmar que la mercadería llegó completa y en buen estado.
* **Report Incident:** formulario de incidencia con tipo, descripción y fotos.
* **Rate Carrier:** diálogo para calificar al transportista.
* **Shipment History:** historial de envíos con búsqueda y filtros.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-shipment-tracking.png" alt="Wireframe Desktop – wireframe desk shipment tracking" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-confirm-delivery.png" alt="Wireframe Desktop – wireframe desk confirm delivery" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-report-incident.png" alt="Wireframe Desktop – wireframe desk report incident" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-rate-carrier.png" alt="Wireframe Desktop – wireframe desk rate carrier" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-shipment-history.png" alt="Wireframe Desktop – wireframe desk shipment history" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-shipment-tracking-1.png" alt="Wireframe Mobile – wireframe mobile shipment tracking 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-shipment-tracking-2.png" alt="Wireframe Mobile – wireframe mobile shipment tracking 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-shipment-tracking-3.png" alt="Wireframe Mobile – wireframe mobile shipment tracking 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-shipment-tracking-4.png" alt="Wireframe Mobile – wireframe mobile shipment tracking 4" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-shipment-history-1.png" alt="Wireframe Mobile – wireframe mobile shipment history 1" width="300">
</div>

#### User Goal 5: Gestionar vehículos y suscripción

Permitir que el transportista registre sus vehículos (cuya capacidad limita las cargas sugeridas) y que ambos usuarios gestionen su plan de suscripción.

My Vehicles presenta cada vehículo en una card con su placa, tipo de carrocería y capacidad, y el formulario de registro valida que la placa no esté duplicada. Plan & Billing muestra el plan actual con una barra de uso, la opción de mejorar al plan Pro y el historial de pagos. Se deja explícito que Trazza solo cobra su propia suscripción: no cobra comisión por flete ni procesa pagos entre transportista y emprendedor.

**Pantallas de flujo**

* **My Vehicles:** lista de vehículos y formulario de registro, con error por placa duplicada.
* **Plan & Billing:** plan actual, uso del mes, upgrade a Pro, método de pago e historial de facturación.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-my-vehicles.png" alt="Wireframe Desktop – wireframe desk my vehicles" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-desk-plan-and-billing.png" alt="Wireframe Desktop – wireframe desk plan and billing" width="700">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-vehicles-1.png" alt="Wireframe Mobile – wireframe mobile vehicles 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-mobile-carrier-plan-billing-1.png" alt="Wireframe Mobile – wireframe mobile carrier plan billing 1" width="300">
</div>

---

### 4.4.2. Web Applications Wireflow Diagrams.

El Wireflow combina la estructura de los wireframes con la lógica de un diagrama de flujo. Permite visualizar no solo qué elementos hay en cada pantalla, sino cómo el usuario se desplaza entre ellas para completar un objetivo. Para Trazza se elaboró un wireflow por cada User Goal principal, tanto en Desktop como en Mobile. Cada diagrama incluye el User Goal redactado, el User Persona, los pasos numerados con la acción que lleva al siguiente paso, los cambios de estado de una misma pantalla como un nuevo wireframe, y los caminos alternativos (unhappy paths) con líneas punteadas.

#### User Goal 1: Publicar una ruta de retorno y asegurar una carga compatible

**User goal:** *As a carrier, I want to publish my return route and secure a compatible load, so that I don’t drive back empty.*

Juan David termina una entrega en Lurín y, desde el Dashboard, selecciona "Publish return route". En el formulario ingresa dónde termina su entrega, su base, el horario, el vehículo y la capacidad libre; si la capacidad supera la del vehículo, el formulario muestra un error en línea y él lo corrige. Al publicar, Trazza muestra las cargas sugeridas dentro de su desvío máximo; si no hay ninguna, un estado vacío lo invita a editar la ruta. Abre una carga, revisa la calificación del emprendedor, el desvío (+1.8 km) y la tarifa ofrecida, y la acepta. El panel cambia a "Offer sent" y, cuando el emprendedor confirma, el viaje aparece en Active Trip en estado "Matched".

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-desk-ug1-return-route-1.png" alt="Wireflow Desktop UG1 – wireframe user flow desk ug1 return route 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-mobile-ug1-return-route-1.png" alt="Wireflow Mobile UG1 – wireframe user flow mobile ug1 return route 1" width="900">
</div>

**El happy path**

Inicio => Juan David se encuentra en el Carrier Dashboard.

Acción => Presiona el botón principal "+ Publish return route".

Ingreso de datos => Completa origen, destino, horario, vehículo y una capacidad válida (1,200 kg).

Confirmación => Presiona "Publish route" y el sistema muestra Load Suggestions.

Selección => Elige la carga de Textiles Andinos SAC (desvío +1.8 km, S/ 180) y presiona "View detail".

Decisión => Revisa la reputación del emprendedor y presiona "Accept S/ 180"; el panel cambia a "Offer sent".

Fin del flujo => El emprendedor confirma el match y el viaje aparece en Active Trip en estado "Matched".

#### User Goal 2: Ejecutar un viaje desde el recojo hasta la entrega

**User goal:** *As a carrier, I want to confirm pickup and delivery in the app, so that the merchant can follow the trip and I can build my reputation.*

Al llegar al punto de recojo, Juan David presiona "Confirm pickup" y el viaje pasa a "In transit": el stepper avanza, se notifica al emprendedor y el navegador del celular comienza a enviar la ubicación del vehículo. Al descargar en destino presiona "Confirm delivery"; si se encuentra a más de 1 km del punto de entrega, el sistema le muestra una advertencia antes de registrar la acción. El viaje pasa a "Delivered", un diálogo le pide calificar al emprendedor y, finalmente, el viaje aparece en Trip History.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-desk-ug2-active-trip-1.png" alt="Wireflow Desktop UG2 – wireframe user flow desk ug2 active trip 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-mobile-ug2-active-trip-1.png" alt="Wireflow Mobile UG2 – wireframe user flow mobile ug2 active trip 1" width="900">
</div>

**El happy path**

Inicio => Juan David abre Active Trip con el viaje en estado "Matched".

Acción => En el punto de recojo presiona "Confirm pickup"; el viaje cambia a "In transit".

Seguimiento => La ubicación se comparte desde su celular mientras se dirige al destino.

Confirmación => En el punto de entrega presiona "Confirm delivery".

Calificación => En el diálogo califica al emprendedor con 4 estrellas y presiona "Submit rating".

Fin del flujo => El viaje aparece en Trip History con estado "Delivered".

#### User Goal 3: Solicitar un flete y cerrar un acuerdo con un transportista

**User goal:** *As a merchant, I want to request freight and agree on a rate with a reliable carrier, so that my goods are shipped at a lower cost.*

Valeria parte de su Dashboard y selecciona "New freight request". Completa direcciones, horario, tipo de carga, peso y, opcionalmente, una tarifa; si falta un campo obligatorio, la solicitud no se publica y el campo se resalta. Luego busca transportistas que ya van hacia su destino y le envía una oferta a Juan David. En Offers ve cada respuesta (aceptada, contraoferta o pendiente) y puede aceptar, contraofertar o rechazar sin salir de Trazza. Al confirmar el match, las demás ofertas se cierran y ambas partes pueden ver el contacto del otro.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-desk-ug3-freight-request-1.png" alt="Wireflow Desktop UG3 – wireframe user flow desk ug3 freight request 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-mobile-ug3-freight-request-1.png" alt="Wireflow Mobile UG3 – wireframe user flow mobile ug3 freight request 1" width="900">
</div>

**El happy path**

Inicio => Valeria se encuentra en el Merchant Dashboard.

Acción => Presiona "+ New freight request".

Ingreso de datos => Completa pickup, delivery, horario, tipo de carga y peso.

Publicación => Presiona "Publish request".

Búsqueda => En Find Carriers elige a Juan David (★ 4.8, 1,200 kg libres) y presiona "Send offer".

Decisión => En Offers ve que Juan David aceptó S/ 180 y presiona "Confirm match".

Fin del flujo => El match queda confirmado, las demás ofertas se cierran y se habilita el seguimiento.

#### User Goal 4: Seguir un envío y confirmar su entrega

**User goal:** *As a merchant, I want to follow my shipment live and confirm it arrived in good condition, so that I feel safe using carriers I don’t know.*

Mientras el envío está en tránsito, Valeria lo sigue en Shipment Tracking y puede compartir un enlace de solo lectura con su cliente. Si el vehículo se aleja más de 2 km de la ruta planificada, aparece una alerta en la parte superior y se le notifica. Cuando el transportista marca el envío como entregado, un diálogo le pregunta si la mercadería llegó completa. Si llegó bien, confirma y califica al transportista, y el envío pasa a Shipment History. Si algo salió mal, elige "No, report an incident" y completa el formulario de incidencia.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-desk-ug4-shipment-tracking-1.png" alt="Wireflow Desktop UG4 – wireframe user flow desk ug4 shipment tracking 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/wireframe-user-flow-mobile-ug4-shipment-tracking-1.png" alt="Wireflow Mobile UG4 – wireframe user flow mobile ug4 shipment tracking 1" width="900">
</div>

**El happy path**

Inicio => Valeria abre Shipment Tracking con el envío SH-3310 en tránsito.

Seguimiento => Revisa la ubicación del vehículo y comparte el enlace con su cliente.

Notificación => El transportista marca el envío como entregado y aparece el diálogo de confirmación.

Confirmación => Valeria presiona "Yes, confirm delivery".

Calificación => Califica a Juan David y presiona "Submit rating".

Fin del flujo => El envío aparece en Shipment History con estado "Delivered".

---

### 4.4.3. Web Applications Mock-ups.

Los mock-ups reflejan la identidad visual final de Trazza en alta fidelidad y aplican el Design System definido en la sección 4.1 sobre la misma estructura de los wireframes. Se presentan organizados por módulo de la Web Application, en sus versiones Desktop y Mobile.

#### Mock-ups Desktop

**Acceso (Sign in / Sign up)**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-auth-sign-in-1.png" alt="Mockup Desktop – mockup desk auth sign in 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-auth-sign-in-2.png" alt="Mockup Desktop – mockup desk auth sign in 2" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-auth-sign-up-1.png" alt="Mockup Desktop – mockup desk auth sign up 1" width="700">
</div>

**Carrier – Dashboard y rutas de retorno**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-carrier-dashboard-1.png" alt="Mockup Desktop – mockup desk carrier dashboard 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-return-routes-1.png" alt="Mockup Desktop – mockup desk return routes 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-return-routes-2.png" alt="Mockup Desktop – mockup desk return routes 2" width="700">
</div>

**Carrier – Sugerencias de carga y ofertas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-load-suggestions-1.png" alt="Mockup Desktop – mockup desk load suggestions 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-load-suggestions-2.png" alt="Mockup Desktop – mockup desk load suggestions 2" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-load-offers-1.png" alt="Mockup Desktop – mockup desk load offers 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-load-offers-2.png" alt="Mockup Desktop – mockup desk load offers 2" width="700">
</div>

**Carrier – Viaje activo, historial y vehículos**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-active-trip-1.png" alt="Mockup Desktop – mockup desk active trip 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-active-trip-2.png" alt="Mockup Desktop – mockup desk active trip 2" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-active-trip-3.png" alt="Mockup Desktop – mockup desk active trip 3" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-active-trip-4.png" alt="Mockup Desktop – mockup desk active trip 4" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-trip-history-1.png" alt="Mockup Desktop – mockup desk trip history 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-vehicles-1.png" alt="Mockup Desktop – mockup desk vehicles 1" width="700">
</div>

**Merchant – Dashboard, solicitudes de flete y búsqueda de transportistas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-merchant-dashboard-1.png" alt="Mockup Desktop – mockup desk merchant dashboard 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-freight-requests-1.png" alt="Mockup Desktop – mockup desk freight requests 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-freight-requests-2.png" alt="Mockup Desktop – mockup desk freight requests 2" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-find-carriers-1.png" alt="Mockup Desktop – mockup desk find carriers 1" width="700">
</div>

**Merchant – Ofertas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-freight-offers-1.png" alt="Mockup Desktop – mockup desk freight offers 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-freight-offers-2.png" alt="Mockup Desktop – mockup desk freight offers 2" width="700">
</div>

**Merchant – Seguimiento del envío e historial**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-shipment-tracking-1.png" alt="Mockup Desktop – mockup desk shipment tracking 1" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-shipment-tracking-2.png" alt="Mockup Desktop – mockup desk shipment tracking 2" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-shipment-tracking-3.png" alt="Mockup Desktop – mockup desk shipment tracking 3" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-shipment-tracking-4.png" alt="Mockup Desktop – mockup desk shipment tracking 4" width="700"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-shipment-history-1.png" alt="Mockup Desktop – mockup desk shipment history 1" width="700">
</div>

**Plan & Billing**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-desk-carrier-plan-billing-1.png" alt="Mockup Desktop – mockup desk carrier plan billing 1" width="700">
</div>

Los mock-ups de escritorio presentan un sistema visual limpio y consistente: fondo claro `#F7F8FF`, cards blancas con sombra sutil, títulos en Plus Jakarta Sans Bold con `#131B2E` y acciones primarias en azul `#0037B0`. La arquitectura de información se organiza mediante un sidebar persistente con los módulos de cada rol, donde el ítem activo se resalta con fondo azul claro y un indicador lateral, y un topbar con breadcrumb, selector de idioma EN | ES, notificaciones y usuario. Las tarifas se muestran en verde `#006C4A`, los desvíos en chips ámbar y los estados (Accepted, Pending, Delivered, Cancelled) en chips que combinan texto y color.

En cuanto a usabilidad e inclusión, la interfaz prioriza la prevención de errores y la retroalimentación constante. Las acciones irreversibles, como confirmar un match o una entrega, se protegen con diálogos de confirmación; la alerta de desvío combina ícono, texto y color; y la acción positiva se diferencia de la negativa (botón azul frente a botón con borde rojo en "Report an incident"). Todos los textos cumplen un contraste mínimo de 4.5:1 (WCAG 2.1 AA).

#### Mock-ups Mobile

**Acceso y menús de navegación**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-auth-sign-in-1.png" alt="Mockup Mobile – mockup mobile auth sign in 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-auth-sign-up-1.png" alt="Mockup Mobile – mockup mobile auth sign up 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-carrier-menu-1.png" alt="Mockup Mobile – mockup mobile carrier menu 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-merchant-menu-1.png" alt="Mockup Mobile – mockup mobile merchant menu 1" width="300">
</div>

**Carrier – Dashboard y rutas de retorno**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-carrier-dashboard-1.png" alt="Mockup Mobile – mockup mobile carrier dashboard 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-return-routes-1.png" alt="Mockup Mobile – mockup mobile return routes 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-return-routes-2.png" alt="Mockup Mobile – mockup mobile return routes 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-return-routes-3.png" alt="Mockup Mobile – mockup mobile return routes 3" width="300">
</div>

**Carrier – Sugerencias de carga y ofertas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-load-suggestions-1.png" alt="Mockup Mobile – mockup mobile load suggestions 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-load-suggestions-2.png" alt="Mockup Mobile – mockup mobile load suggestions 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-load-suggestions-3.png" alt="Mockup Mobile – mockup mobile load suggestions 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-load-offers-1.png" alt="Mockup Mobile – mockup mobile load offers 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-load-offers-2.png" alt="Mockup Mobile – mockup mobile load offers 2" width="300">
</div>

**Carrier – Viaje activo, historial y vehículos**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-active-trip-1.png" alt="Mockup Mobile – mockup mobile active trip 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-active-trip-2.png" alt="Mockup Mobile – mockup mobile active trip 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-active-trip-3.png" alt="Mockup Mobile – mockup mobile active trip 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-active-trip-4.png" alt="Mockup Mobile – mockup mobile active trip 4" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-active-trip-5.png" alt="Mockup Mobile – mockup mobile active trip 5" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-trip-history-1.png" alt="Mockup Mobile – mockup mobile trip history 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-vehicles-1.png" alt="Mockup Mobile – mockup mobile vehicles 1" width="300">
</div>

**Merchant – Dashboard, solicitudes de flete y búsqueda de transportistas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-merchant-dashboard-1.png" alt="Mockup Mobile – mockup mobile merchant dashboard 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-requests-1.png" alt="Mockup Mobile – mockup mobile freight requests 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-requests-2.png" alt="Mockup Mobile – mockup mobile freight requests 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-requests-3.png" alt="Mockup Mobile – mockup mobile freight requests 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-find-carriers-1.png" alt="Mockup Mobile – mockup mobile find carriers 1" width="300">
</div>

**Merchant – Ofertas**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-offers-1.png" alt="Mockup Mobile – mockup mobile freight offers 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-offers-2.png" alt="Mockup Mobile – mockup mobile freight offers 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-freight-offers-3.png" alt="Mockup Mobile – mockup mobile freight offers 3" width="300">
</div>

**Merchant – Seguimiento del envío e historial**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-tracking-1.png" alt="Mockup Mobile – mockup mobile shipment tracking 1" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-tracking-2.png" alt="Mockup Mobile – mockup mobile shipment tracking 2" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-tracking-3.png" alt="Mockup Mobile – mockup mobile shipment tracking 3" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-tracking-4.png" alt="Mockup Mobile – mockup mobile shipment tracking 4" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-tracking-5.png" alt="Mockup Mobile – mockup mobile shipment tracking 5" width="300"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-shipment-history-1.png" alt="Mockup Mobile – mockup mobile shipment history 1" width="300">
</div>

**Plan & Billing**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/mockup-mobile-carrier-plan-billing-1.png" alt="Mockup Mobile – mockup mobile carrier plan billing 1" width="300">
</div>

La versión mobile mantiene la coherencia con el diseño de escritorio y usa los mismos tokens de color, tipografía y componentes. La arquitectura de información se adapta a pantallas pequeñas reemplazando el sidebar por un menú tipo drawer, accesible desde el app bar, y ordenando el contenido en una sola columna: el mapa se ubica sobre la lista, los KPIs se organizan en una grilla de 2 × 2 y las tablas se convierten en cards. Las acciones principales ocupan todo el ancho de la pantalla, con un área táctil mínima de 44 px, lo que facilita la interacción con una sola mano, por ejemplo cuando el transportista está junto a su vehículo.

A nivel interactivo se priorizan patrones propios del entorno móvil: las confirmaciones, calificaciones y advertencias se muestran como bottom sheets que no hacen perder el contexto, la alerta de desvío permanece fija en la parte superior y el enlace de seguimiento se comparte mediante el menú nativo del teléfono. Este enfoque responde a las limitaciones del dispositivo y ofrece una navegación intuitiva, retroalimentación constante y un diseño accesible para distintos tipos de usuarios.

---

### 4.4.4. Web Applications User Flow Diagrams.

Mientras que el wireflow se enfoca en las pantallas, el User Flow se centra en el proceso de toma de decisiones del usuario. Para cada User Goal se elaboró un User Flow con los mock-ups de la aplicación, en Desktop y en Mobile, que muestra el camino esperado (happy path) con línea continua y los caminos alternativos (unhappy paths) con línea punteada roja; cada flecha indica la condición que la activa. Esto permite identificar posibles fricciones y asegurar que el sistema responda de forma coherente en cada punto de decisión.

#### User Goal 1: Publicar una ruta de retorno y asegurar una carga compatible

Como transportista independiente, Juan David Ramos quiere publicar su ruta de retorno y conseguir una carga compatible para no regresar con el camión vacío.

En este escenario, Juan David publica su ruta desde el Dashboard. El flujo valida que la capacidad ingresada no supere la del vehículo y, después de publicar, muestra solo las cargas que están dentro de su desvío máximo. En el detalle de la carga decide si acepta la tarifa, envía una contraoferta o la rechaza; el viaje se crea cuando el emprendedor confirma el match.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-desk-ug1-return-route-1.jpeg" alt="User Flow Desktop UG1 – user flow desk ug1 return route 1" width="900"><br><br>
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-desk-ug1-return-route-2.jpeg" alt="User Flow Desktop UG1 – user flow desk ug1 return route 2" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-mobile-ug1-return-route-1.jpeg" alt="User Flow Mobile UG1 – user flow mobile ug1 return route 1" width="900">
</div>

**El happy path:** Carga asegurada

Inicio => Juan David se encuentra en el Carrier Dashboard.

Acción => Presiona "+ Publish return route".

Ingreso de datos => Completa la ruta Lurín → Los Olivos con una capacidad libre de 1,200 kg, menor a la del vehículo.

Decisión => El sistema encuentra 3 cargas compatibles y Juan David abre la de Textiles Andinos SAC.

Confirmación => Presiona "Accept S/ 180" y el panel cambia a "Offer sent".

Fin del flujo => El emprendedor confirma el match y el viaje aparece como "Matched" en Active Trip.

**El unhappy path:** Capacidad mayor a la del vehículo

Inicio => Juan David completa el formulario de la ruta de retorno.

Ingreso de datos => Escribe 4,000 kg de capacidad libre en un vehículo de 3,500 kg.

Validación => El sistema muestra el error "Capacity cannot exceed 3,500 kg" y deshabilita "Publish route".

Fin del flujo => Juan David corrige la capacidad y vuelve al formulario para publicar.

**El unhappy path:** Sin cargas compatibles

Inicio => Juan David publica su ruta de retorno.

Validación => El sistema no encuentra cargas dentro del desvío máximo.

Notificación => Se muestra el estado vacío "No loads match your route yet".

Fin del flujo => Juan David edita la ruta (por ejemplo, aumenta el desvío máximo) o espera la notificación de una nueva carga.

#### User Goal 2: Ejecutar un viaje desde el recojo hasta la entrega

Como transportista, Juan David Ramos quiere confirmar el recojo y la entrega desde la aplicación para que el emprendedor pueda seguir el viaje y él construya su reputación.

En este escenario, Juan David avanza el viaje con una sola acción por estado. Al confirmar la entrega, el sistema verifica su ubicación respecto al punto de entrega y, si está lejos, le pide confirmar antes de registrar la acción. Al terminar, califica al emprendedor.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-desk-ug2-active-trip-1.jpeg" alt="User Flow Desktop UG2 – user flow desk ug2 active trip 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-mobile-ug2-active-trip-1.jpeg" alt="User Flow Mobile UG2 – user flow mobile ug2 active trip 1" width="900">
</div>

**El happy path:** Viaje completado

Inicio => Juan David abre Active Trip con el viaje en estado "Matched".

Acción => En el punto de recojo presiona "Confirm pickup".

Seguimiento => El viaje pasa a "In transit" y se comparte su ubicación.

Confirmación => En el punto de entrega presiona "Confirm delivery".

Calificación => Califica al emprendedor y presiona "Submit rating".

Fin del flujo => El viaje aparece en Trip History como "Delivered".

**El unhappy path:** Confirmación lejos del destino

Inicio => Juan David presiona "Confirm delivery" antes de llegar al punto de entrega.

Validación => El sistema detecta que está a 1.6 km del destino.

Advertencia => Se muestra el diálogo "You seem to be 1.6 km away from the delivery point".

Fin del flujo => Juan David presiona "Go back" y regresa al viaje en curso, o "Confirm anyway" si la mercadería ya fue recibida.

#### User Goal 3: Solicitar un flete y cerrar un acuerdo con un transportista

Como emprendedora MYPE, Valeria Torres quiere solicitar un flete y acordar la tarifa con un transportista confiable para enviar su mercadería a menor costo.

En este escenario, Valeria crea una solicitud de flete, busca transportistas que ya van hacia su destino y gestiona sus respuestas en Offers. Puede aceptar, contraofertar o rechazar cada oferta, y al confirmar un match las demás se cierran automáticamente.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-desk-ug3-freight-request-1.jpeg" alt="User Flow Desktop UG3 – user flow desk ug3 freight request 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-mobile-ug3-freight-request-1.jpeg" alt="User Flow Mobile UG3 – user flow mobile ug3 freight request 1" width="900">
</div>

**El happy path:** Match confirmado

Inicio => Valeria se encuentra en el Merchant Dashboard.

Acción => Presiona "+ New freight request".

Ingreso de datos => Completa todos los campos obligatorios y presiona "Publish request".

Búsqueda => En Find Carriers envía una oferta a Juan David.

Decisión => En Offers ve que Juan David aceptó y presiona "Confirm match".

Fin del flujo => El match se confirma y se habilita el seguimiento del envío.

**El unhappy path:** Campo obligatorio vacío

Inicio => Valeria completa la solicitud de flete.

Acción => Presiona "Publish request" sin ingresar la dirección de entrega.

Validación => El sistema resalta el campo con el mensaje "Enter the delivery address".

Fin del flujo => Valeria completa el campo y publica la solicitud.

**El unhappy path:** Contraoferta del transportista

Inicio => En Offers, Carlos Mendoza propone S/ 200 en lugar de S/ 180.

Decisión => Valeria abre el panel de contraoferta.

Acción => Propone S/ 190 y presiona "Send".

Fin del flujo => La oferta vuelve al transportista y Offers muestra el nuevo estado.

#### User Goal 4: Seguir un envío y confirmar su entrega

Como emprendedora MYPE, Valeria Torres quiere seguir su envío en tiempo real y confirmar que llegó en buen estado para sentirse segura al trabajar con transportistas que no conoce.

En este escenario, Valeria sigue el envío en el mapa y recibe una alerta si el vehículo se aleja más de 2 km de la ruta planificada. Cuando el transportista marca la entrega, decide si confirma la recepción o reporta una incidencia.

**Desktop**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-desk-ug4-shipment-tracking-1.jpeg" alt="User Flow Desktop UG4 – user flow desk ug4 shipment tracking 1" width="900">
</div>

**Mobile**
<div align="center">
  <img src="../assets/images/chapter4/web-applications-ux-ui-design/user-flow-mobile-ug4-shipment-tracking-1.jpeg" alt="User Flow Mobile UG4 – user flow mobile ug4 shipment tracking 1" width="900">
</div>

**El happy path:** Entrega confirmada

Inicio => Valeria abre Shipment Tracking con el envío en tránsito.

Seguimiento => Comparte el enlace de seguimiento con su cliente.

Notificación => El transportista marca el envío como entregado.

Confirmación => Valeria presiona "Yes, confirm delivery".

Calificación => Califica a Juan David y presiona "Submit rating".

Fin del flujo => El envío aparece en Shipment History como "Delivered".

**El unhappy path:** Mercadería con daños

Inicio => Valeria recibe el diálogo de confirmación de entrega.

Decisión => Las cajas llegaron mojadas y presiona "No, report an incident".

Ingreso de datos => Selecciona "Damaged goods", describe el problema y adjunta fotos.

Fin del flujo => Presiona "Send report"; el soporte de Trazza y ambas partes son notificados.

**El unhappy path:** Desvío de ruta

Inicio => El vehículo se aleja 2.4 km de la ruta planificada.

Notificación => Shipment Tracking muestra la alerta de desvío y Valeria recibe una notificación.

Fin del flujo => La alerta desaparece cuando el vehículo vuelve a la ruta.
