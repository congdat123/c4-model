workspace {
    model {
        user = person "User" "A user wants to place an order, has a personal account of the website" "User"
        enterprise {
            payment = softwareSystem "Payment" "Provide payment methods" "Existing System"
            notificationSendingSystem = softwareSystem "Notification Sending System" "When a customer places an order, the system sends a notification" "Existing System"
            onlineFoodOderingSystem = softwareSystem "Online Food Ordering System" "Allows users to view food, personal, and order information" {
                webApplication = container "Web Application" "Delivers the static content and the online ordering single-page application. 'JS and VueJS'" "apache" {
                    loginView = component "Login View " "Customer data processing" "VueJS"
                    registerView = component "Register View " "Customer data processing" "VueJS"
                    productView = component "Product View " "Customer data processing" "VueJS"
                    checkOutView = component "Check Out View" "Customer data processing" "VueJS"
                    detailProductView = component "Detail Product View" "Customer data processing" "VueJS"
                    profileAccountView = component "Profile Account View" "Customer data processing" "VueJS"
                    billView = component "Bill View " "Customer data processing" "VueJS"
                }
                adminApplication = container "Admin Application" "Information management" "JS and VueJS"{
                    accountViewAdmin = component "Account View Admin" "Customer data processing" "VueJS"
                    loginViewAdmin = component "Login View Admin" "Customer data processing" "VueJS"
                    registerViewAdmin = component "Register View Admin" "Customer data processing" "VueJS"
                    productViewAdmin = component "Product View Admin" "Customer data processing" "VueJS"
                    slideViewAdmin = component "Slide View Admin" "Customer data processing" "VueJS"
                    billViewAdmin = component "Bill View Admin" "Customer data processing" "VueJS"
                    newViewAdmin = component "New View Admin" "Customer data processing" "VueJS"
                }
                database = container "Database" "Stores user registration information, hashed authentication credentials, access logs, etc.'SQL Server Database' 'Database'" "SQL Server" "Database"
                apiApplication = container "API Application" "Provides of online odering system functionality via /HTTPS API.'C# and ASP.NET core'" "C# and ASP.NET Core"{
                    customerController = component "Customer Controller" "Customer data processing" "ASP.NET Core Rest Controller"
                    newController = component "New Controller" "Restaurant information processing" "ASP.NET Core Rest Controller"
                    signInController = component "Sign In Controller" "Allow user to log into the online food ordering system" "ASP.NET Core Rest Controller"
                    sliderController = component "Slider Controller" "Slider data processing" "ASP.NET Core Rest Controller"
                    productControlelr = component "Product Controller" "Product data processing" "ASP.NET Core Rest Controller"
                    notificationController = component "Notification Controller" "Notification data processing" "ASP.NET Core Rest Controller"
                    billController = component "Bill Controller" "Oder data processing" "ASP.NET Core Rest Controller"
                    cartController = component "Cart Controller" "Cart data processing" "ASP.NET Core Rest Controller"
                }
            }
        }
        //context
        user -> onlineFoodOderingSystem "Roles: manager and user"
        onlineFoodOderingSystem -> payment "Payment request"
        onlineFoodOderingSystem -> notificationSendingSystem "send Notification using"
        notificationSendingSystem -> user "Send Notification to"

        //container
        user -> adminApplication "manager" 
        user -> webApplication "user"
        notificationSendingSystem -> user "send notification to"
        webApplication -> payment "Payment request"
        adminApplication -> apiApplication "Makes API calls to "HTTP
        webApplication -> apiApplication "Makes API calls to "HTTP
        apiApplication -> notificationSendingSystem "send notification using"
        apiApplication -> database "Read from and Write to"

        //component API Application
        adminApplication -> customerController "Makes API calls to "HTTP
        adminApplication -> newController "Makes API calls to "HTTP
        adminApplication -> signInController "Makes API calls to "HTTP
        adminApplication -> sliderController "Makes API calls to "HTTP
        adminApplication -> productControlelr "Makes API calls to "HTTP
        adminApplication -> notificationController "Makes API calls to "HTTP
        adminApplication -> cartController "Makes API calls to "HTTP

        webApplication -> customerController "Makes API calls to "HTTP
        webApplication -> newController "Makes API calls to "HTTP
        webApplication -> signInController "Makes API calls to "HTTP
        webApplication -> sliderController "Makes API calls to "HTTP
        webApplication -> productControlelr "Makes API calls to "HTTP
        webApplication -> notificationController "Makes API calls to "HTTP
        webApplication -> billController "Makes API calls to "HTTP
        webApplication -> cartController "Makes API calls to "HTTP

         customerController -> database "Read from and Write to "
         newController -> database "Read from and Write to "
         signInController -> database "Read from and Write to "
         sliderController -> database "Read from and Write to "
         productControlelr -> database "Read from and Write to "
         notificationController -> database "Read from and Write to "
         billController -> database "Read from and Write to "
         cartController -> database "Read from and Write to "

        //  component Admin Application
        accountViewAdmin -> apiApplication "Makes API calls to "HTTP
        loginViewAdmin -> apiApplication "Makes API calls to "HTTP
        registerViewAdmin -> apiApplication "Makes API calls to "HTTP
        productViewAdmin -> apiApplication "Makes API calls to "HTTP
        slideViewAdmin -> apiApplication "Makes API calls to "HTTP
        billViewAdmin -> apiApplication "Makes API calls to "HTTP
        newViewAdmin -> apiApplication "Makes API calls to "HTTP

        webApplication -> apiApplication "Makes API calls to "HTTP
        
        apiApplication -> database "Read from and Write to "

        // component Web Application
        loginView -> apiApplication "Makes API calls to "HTTP
        registerView -> apiApplication "Makes API calls to "HTTP
        productView -> apiApplication "Makes API calls to "HTTP
        checkOutView -> apiApplication "Makes API calls to "HTTP
        detailProductView -> apiApplication "Makes API calls to "HTTP
        profileAccountView -> apiApplication "Makes API calls to "HTTP
        billView -> apiApplication "Makes API calls to "HTTP

        adminApplication -> apiApplication "Makes API calls to "HTTP
        
        apiApplication -> database "Read from and Write to "

    }
    views {
        systemContext onlineFoodOderingSystem "OnlineFoodOderingSystemContext"{
            include *
            autoLayout tb
        }
        container onlineFoodOderingSystem "Containers" {
            include *
            autoLayout 
        }

        component apiApplication "ComponentsApiApplication" {
            include *
            autoLayout
        }
        component adminApplication "ComponentsAdminApplication" {
            include *
            autoLayout
        }
        component webApplication "ComponentsWebApplication" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                shape Person
                color #ffffff
                background #08427b
                fontSize 22
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Database"{
                shape Cylinder
            }
        }
    }
}