workspace "Trazza" "C4 model of the Trazza logistics platform (StackRoot): connects carriers with empty return trips and small/medium entrepreneurs who need to ship goods in Lima." {

    model {

        # ---------------------------------------------------------------
        # People
        # ---------------------------------------------------------------
        carrier = person "Ground Freight Carrier" "Independent driver or owner of a small fleet. Publishes return routes and available capacity, accepts loads, negotiates the rate and receives payment." "Person"
        entrepreneur = person "Small / Medium Entrepreneur" "Owner of an MSME who posts shipment requests, looks for reliable carriers, tracks their goods, pays for the service and rates it." "Person"

        # ---------------------------------------------------------------
        # External systems
        # ---------------------------------------------------------------
        maps = softwareSystem "Google Maps Platform" "Provides maps, geocoding and traffic data to plan and display routes." "External"
        kyc = softwareSystem "Identity Validation Service (KYC)" "Validates carriers' national ID (DNI) during registration." "External"
        notifications = softwareSystem "Email and Notification Service" "Sends emails and push notifications to users." "External"
        paymentGw = softwareSystem "Payment Gateway" "Processes card and digital wallet payments and confirms their status to the platform." "External"
        invoicing = softwareSystem "Electronic Invoicing Service (OSE/SUNAT)" "Validates and registers electronic receipts issued by the platform (future scope)." "External,Future"
        gps = softwareSystem "GPS / IoT Devices" "Hardware installed in the vehicle that reports location and cargo status, even with intermittent connectivity (future scope)." "External,Future"

        # ---------------------------------------------------------------
        # Software system: Trazza Platform
        # ---------------------------------------------------------------
        trazza = softwareSystem "Trazza Platform" "Platform that matches carriers' idle capacity with entrepreneurs' shipments, optimizes routes, enables real-time cargo tracking and handles payments and receipts through an external payment gateway." {

            landing = container "Landing Page" "Static website presenting the value proposition for each segment (carrier and entrepreneur), testimonials, and links to sign up and log in." "HTML, CSS, JavaScript (deployed on AWS Amplify)" "Static Site"

            webapp = container "Web Application" "Single-Page Application that runs in the user's browser and delivers all of Trazza's functionality." "Vue.js, JavaScript (deployed on AWS Amplify)" "Web Browser" {

                webIam = component "IAM & Profiles (Frontend)" "Sign up, login, carrier and entrepreneur profiles, fleet management and identity validation." "Vue.js Bounded Context Module"
                webMatch = component "Matchmaking & Routing (Frontend)" "Return route publishing, shipment requests, load suggestions, search, negotiation and chat." "Vue.js Bounded Context Module"
                webMonitor = component "Service Execution & Monitoring (Frontend)" "Pickup and delivery confirmation, live map, browser geolocation sharing, route deviation alerts, trip history and incident reporting." "Vue.js Bounded Context Module"
                webPayment = component "Payment & Billing (Frontend)" "Payment of the agreed rate, payment status, payment history and receipts." "Vue.js Bounded Context Module"
                webReputation = component "Loyalty & Reputation (Frontend)" "Carrier and entrepreneur ratings and reputation display." "Vue.js Bounded Context Module"
            }

            api = container "API Application" "RESTful backend service that exposes Trazza's business logic, secures routes with JWT, and runs the matching engine and routing algorithms." "C#, ASP.NET Core (deployed on AWS EC2)" "API" {

                apiIam = component "IAM & Profiles" "Registration, JWT authentication, password hashing, profiles, vehicles and identity validation (KYC)." "ASP.NET Core Bounded Context (Interfaces, Application, Domain, Infrastructure)"
                apiMatch = component "Matchmaking & Routing" "Core Domain: manages return routes and shipment requests, runs the AI matching engine, computes routes (Dijkstra, TSP, Backtracking, BFS) and handles negotiation and chat." "ASP.NET Core Bounded Context (Interfaces, Application, Domain, Infrastructure)"
                apiMonitor = component "Service Execution & Monitoring" "Manages the trip lifecycle, receives location coordinates (browser geolocation now, GPS/IoT devices in the future), detects route deviations and records cargo incidents." "ASP.NET Core Bounded Context (Interfaces, Application, Domain, Infrastructure)"
                apiPayment = component "Payment & Billing" "Registers payment transactions for completed trips, integrates with the payment gateway and issues receipts." "ASP.NET Core Bounded Context (Interfaces, Application, Domain, Infrastructure)"
                apiReputation = component "Loyalty & Reputation" "Records ratings between users and maintains each user's reputation summary." "ASP.NET Core Bounded Context (Interfaces, Application, Domain, Infrastructure)"
                apiNotif = component "Notifications" "Generates and sends notifications for business events (matches, proposals, status changes, payments, alerts)." "ASP.NET Core Cross-cutting Service"
            }

            db = container "Database" "Stores users, profiles, vehicles, return routes, requests, negotiations, trips, incidents, payments, receipts and ratings." "MySQL (AWS RDS)" "Database"
        }

        # ---------------------------------------------------------------
        # Relationships: Context
        # ---------------------------------------------------------------
        carrier -> trazza "Publishes return routes, receives suggested loads, negotiates rates, confirms pickup and delivery and receives payment"
        entrepreneur -> trazza "Requests shipments, searches for carriers, tracks goods, pays for the service and rates it"

        trazza -> maps "Retrieves maps, geocoding and traffic" "HTTPS/JSON"
        trazza -> kyc "Validates carriers' national ID" "HTTPS/JSON"
        trazza -> notifications "Requests emails and notifications to be sent" "HTTPS/JSON"
        trazza -> paymentGw "Requests charges and receives payment confirmations" "HTTPS/JSON"
        trazza -> invoicing "Sends electronic receipts for validation (future)" "HTTPS/JSON"
        gps -> trazza "Reports location and cargo status" "HTTPS/JSON"
        notifications -> carrier "Sends emails and notifications"
        notifications -> entrepreneur "Sends emails and notifications"

        # ---------------------------------------------------------------
        # Relationships: Containers
        # ---------------------------------------------------------------
        carrier -> landing "Learns about the platform's benefits" "HTTPS"
        entrepreneur -> landing "Learns about the platform's benefits" "HTTPS"
        carrier -> webapp "Manages routes, loads, trips and payments" "HTTPS"
        entrepreneur -> webapp "Manages shipments, tracks goods and pays" "HTTPS"

        landing -> webapp "Redirects to sign up and login" "HTTPS"
        webapp -> api "Consumes business services" "JSON/HTTPS (REST + JWT)"
        api -> db "Reads and writes data" "SQL/TCP (EF Core)"
        webapp -> maps "Renders maps and routes in the browser" "HTTPS/JavaScript"
        webapp -> paymentGw "Tokenizes payment data in the browser" "HTTPS/JavaScript"
        api -> maps "Retrieves distances, times and geocoding" "HTTPS/JSON"
        api -> kyc "Validates carriers' national ID" "HTTPS/JSON"
        api -> notifications "Requests notifications to be sent" "HTTPS/JSON"
        api -> paymentGw "Creates charges and queries payment status" "HTTPS/JSON"
        paymentGw -> api "Confirms payment status (webhook)" "HTTPS/JSON"
        api -> invoicing "Sends electronic receipts for validation (future)" "HTTPS/JSON"
        gps -> api "Reports GPS coordinates and cargo status" "HTTPS/JSON"

        # ---------------------------------------------------------------
        # Relationships: Web Application components (frontend)
        # ---------------------------------------------------------------
        webIam -> api "Sign up, login, profiles and fleet" "JSON/HTTPS (REST + JWT)"
        webMatch -> api "Routes, requests, suggestions, negotiation and chat" "JSON/HTTPS (REST + JWT)"
        webMonitor -> api "Trip status, browser geolocation, alerts and incidents" "JSON/HTTPS (REST + JWT)"
        webPayment -> api "Payments and receipts" "JSON/HTTPS (REST + JWT)"
        webReputation -> api "Ratings and reputation" "JSON/HTTPS (REST + JWT)"
        webMatch -> maps "Displays routes and pickup and delivery points" "HTTPS/JavaScript"
        webMonitor -> maps "Displays the vehicle's location on the map" "HTTPS/JavaScript"
        webPayment -> paymentGw "Tokenizes payment data in the browser" "HTTPS/JavaScript"

        # Session dependency: the consumer modules read the session from IAM
        webMatch -> webIam "Reads the authenticated user's session and role"
        webMonitor -> webIam "Reads the authenticated user's session and role"
        webPayment -> webIam "Reads the authenticated user's session and role"
        webReputation -> webIam "Reads the authenticated user's session and role"

        # Business flow between modules
        webMatch -> webMonitor "Starts tracking once the rate is agreed"
        webMonitor -> webPayment "Enables payment when delivery is confirmed"
        webMonitor -> webReputation "Enables rating when the trip is completed"

        # ---------------------------------------------------------------
        # Relationships: API Application components (backend)
        # ---------------------------------------------------------------
        webapp -> apiIam "Registration, authentication and profiles" "JSON/HTTPS (REST + JWT)"
        webapp -> apiMatch "Routes, requests, negotiation and chat" "JSON/HTTPS (REST + JWT)"
        webapp -> apiMonitor "Trip tracking, geolocation and incidents" "JSON/HTTPS (REST + JWT)"
        webapp -> apiPayment "Payments and receipts" "JSON/HTTPS (REST + JWT)"
        webapp -> apiReputation "Ratings and reputation" "JSON/HTTPS (REST + JWT)"
        gps -> apiMonitor "Reports GPS coordinates and cargo status" "HTTPS/JSON"
        paymentGw -> apiPayment "Confirms payment status (webhook)" "HTTPS/JSON"

        apiIam -> db "Reads and writes users, profiles and vehicles" "SQL/TCP (EF Core)"
        apiMatch -> db "Reads and writes routes, requests and negotiations" "SQL/TCP (EF Core)"
        apiMonitor -> db "Reads and writes trips, locations and incidents" "SQL/TCP (EF Core)"
        apiPayment -> db "Reads and writes payment transactions and receipts" "SQL/TCP (EF Core)"
        apiReputation -> db "Reads and writes ratings and reputation summaries" "SQL/TCP (EF Core)"

        apiIam -> kyc "Validates the carrier's national ID" "HTTPS/JSON"
        apiMatch -> maps "Retrieves distances and times for the cost matrix" "HTTPS/JSON"
        apiMonitor -> maps "Compares location against the planned route" "HTTPS/JSON"
        apiPayment -> paymentGw "Creates charges and queries payment status" "HTTPS/JSON"
        apiPayment -> invoicing "Sends electronic receipts for validation (future)" "HTTPS/JSON"

        apiMatch -> apiIam "Queries profiles and vehicles (capacity)"
        apiMonitor -> apiMatch "Queries the trip's agreement and route"
        apiPayment -> apiMonitor "Verifies the trip is delivered and gets the agreed trip"
        apiReputation -> apiMonitor "Verifies the trip is completed"

        apiMatch -> apiNotif "Notifies matches and proposals"
        apiMonitor -> apiNotif "Notifies status changes and deviation alerts"
        apiPayment -> apiNotif "Notifies payment results and receipts"
        apiIam -> apiNotif "Notifies identity validation result"
        apiNotif -> notifications "Sends emails and notifications" "HTTPS/JSON"

        # ---------------------------------------------------------------
        # Deployment
        # ---------------------------------------------------------------
        production = deploymentEnvironment "Production" {

            deploymentNode "AWS Amplify" "Static hosting and CI/CD" "AWS Amplify Hosting" {
                containerInstance landing
                containerInstance webapp
            }

            deploymentNode "AWS EC2" "Application server" "Amazon EC2 (Linux)" {
                containerInstance api
            }

            deploymentNode "AWS RDS" "Managed relational database" "Amazon RDS" {
                containerInstance db
            }
        }
    }

    views {

        systemContext trazza "SystemContext" "System Context diagram (Level 1) of the Trazza Platform." {
            include *
            autoLayout lr
        }

        container trazza "Containers" "Container diagram (Level 2) of the Trazza Platform." {
            include *
            autoLayout lr
        }

        component webapp "Components-WebApp" "Component diagram (Level 3): Web Application, divided by Bounded Contexts." {
            include *
            autoLayout lr
        }

        component api "Components-API" "Component diagram (Level 3): API Application, divided by Bounded Contexts." {
            include *
            autoLayout lr
        }

        deployment trazza "Production" "Deployment" "Deployment diagram of the Trazza Platform on AWS." {
            include *
            autoLayout lr
        }

        styles {
            element "Element" {
                color #1168bd
                stroke #1168bd
                strokeWidth 5
                shape roundedbox
            }
            element "Person" {
                color #2d8000
                stroke #2d8000
                shape person
            }
            element "External" {
                color #c0111f
                stroke #c0111f
            }
            element "Future" {
                border dashed
            }
            element "Static Site" {
                shape folder
            }
            element "Web Browser" {
                shape webbrowser
            }
            element "API" {
                shape hexagon
            }
            element "Database" {
                shape cylinder
            }
            element "Boundary" {
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
                color #444444
            }
        }
    }
}