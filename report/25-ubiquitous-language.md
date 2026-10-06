## 2.5. Ubiquitous Language
| Term (EN) | Definición (ES) |
|---|---|
| **Carrier** (Transportista) | Conductor independiente o dueño de una flota pequeña/mediana que ofrece espacio de carga disponible, especialmente en su viaje de retorno. Es el usuario del lado de la **oferta**. |
| **Fleet** (Flota) | Conjunto de vehículos (de 1 a 5 unidades, según el perfil predominante) administrados por un mismo transportista. |
| **Merchant** (Emprendedor/Pyme) | Dueño o gestor de una micro, pequeña o mediana empresa (comercial, manufacturera o agrícola) que necesita enviar mercadería sin contar con contratos fijos con grandes operadores logísticos. Es el usuario del lado de la **demanda**. |
| **Shipment** (Envío/Carga) | Mercadería publicada por un Merchant que requiere ser trasladada de un punto de origen a un punto de destino dentro de Lima. |
| **Empty Backhaul** (Flete Vacío) | Trayecto de retorno que realiza un Carrier sin mercadería a bordo, generando pérdida de rentabilidad (hasta 30%) y mayor huella de carbono. Es el problema central que resuelve Trazza. |
| **Available Capacity** (Espacio Disponible) | Capacidad de carga ociosa que un Carrier publica en la plataforma, normalmente correspondiente a un viaje de retorno. |
| **Match** (Emparejamiento) | Vinculación automática entre un Shipment publicado por un Merchant y la Available Capacity de un Carrier, generada por el Motor de emparejamiento con IA. |
| **Route Optimization** (Optimización de Ruteo) | Cálculo del trayecto más eficiente entre el punto de recojo y el de entrega, mediante algoritmos como Dijkstra, TSP, Backtracking y BFS. |
| **Cost Matrix** (Matriz de Costos) | Estructura de datos generada por el motor de optimización que compara distancias, tiempos y costos entre distintas combinaciones de rutas posibles. |
| **Tracking** (Monitoreo/Trazabilidad) | Seguimiento en tiempo real de la ubicación y estado de la mercancía durante el trayecto, mediante GPS e integraciones IoT futuras. |
| **External Settlement** (Liquidación Externa) | Principio de diseño por el cual Trazza no procesa pagos: toda transacción monetaria entre Carrier y Merchant se gestiona por canales externos a la app. |
