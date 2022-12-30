workspace {
    model {
        user = person "User" "A user wants to place an order, has a personal account of the website" "Person"
        enterprise {
            onlineFoodOderingSystem = softwareSystem "Online Food Ordering System" "Allows users to view food, personal, and order information" {
                webApplication = container "Web Application" "Run application code login browser" "JS and VueJS" {
                    loginUserView = component "Login User View" "Run application code login browser" "VueJS and JS"
                    registerCustomerView = component "Register Customer View" "Run application code Register Customer browser" "VueJS and JS"
                    customerProfileDetail = component "Customer Profile Detail" "Run application code Customer Profile Detail Browser"  "VueJS and JS"
                    cartDetailView = component "Cart Detail View" "Product Data Processing" "VueJS and JS"
                    productDetailView = component "Product Detail View" "Product Data Processing" "VueJS and JS"
                    productManageView = component "Product Manage View" "Product Data Processing" "VueJS and JS"
                    billDetailView = component "Biill Detail View" "Run application code Bill Detail Browser" "VueJS and JS"
                    billManageView = component "Biill Manage View" "Run application code Bill Manage Browser" "VueJS and JS"
                    checkOutView = component "Check Out View" "Run application code Check Out Browser" "VueJS and JS"
                    homeView = component "Home View" "Run application code Home view Browser" "VueJS and JS"
                    sliderManageView = component "Slider Manage View" "Run application code Slider Manage Browser" "VueJS and JS"
                    newManageView = component "News Manage View" "Run application code News Manage Browser" "VueJS and JS"
                }
                adminApplication = container "Admin Application" "Run application code login browser" "JS and VueJS" {
                    loginAdminView = component "Login Admin View" "Run application code login browser" "VueJS and JS"
                    customerManageView = component "Customer Manage View" "Run application code login browser" "VueJS and JS"
                }
                apiApplication = container "API Application" "Provides of online odering system functionality via /HTTPS API.'C# and ASP.NET core'" "C# and ASP.NET core"{
                    loginUserController = component "Login User Controller" "Provide API interface check token user" "ASP.NET Core Rest Controller"
                    loginModel = component "Login Model" "Provide cached data model of login by user" "ASP.NET Core Rest Model"
                    loginAdminController = component "Login Admin Controller" "Provide API interface check token admin" "ASP.NET Core Rest Controller"
                    adminModel = component "Admin Model" "Provide data model of login user and interface to database" "ASP.NET Core Rest Model"

                    customerController = component "Customer Controller" "Provide API interface customer" "ASP.NET Core Rest Controller"
                    addCustomerModel = component "Add Customer Model" "Provide cached data model of register by customer" "ASP.NET Core Rest Model"
                    customerModel = component "Customer Model" "Provide data model of login user and interface to database" "ASP.NET Core Rest Model"

                    cartController = component "Cart Controller" "Provide API interface Cart" "ASP.NET Core Rest Controller"
                    cartModel = component "Cart Model" "Provide data model of cart and interfce to database" "ASP.NET Core Rest Model"
                    addCartModel = component "Add Cart Model" "Provide cached data model of cart by customer" "ASP.NET Core Rest Model"

                    billController = component "Bill Controller" "Provide API interface Cart" "ASP.NET Core Rest Controller"
                    billModel = component "Bill Model" "Provide data model of bill and interfce to database" "ASP.NET Core Rest Model"
                    addBillModel = component "Add Bill Model" "Provide cached data model of cart by customer""ASP.NET Core Rest Model"

                    productController = component "Product Controller" "Provide API interface Product" "ASP.NET Core Rest Controller"
                    productModel = component "Product Model" "Provide data model of product and interfce to database" "ASP.NET Core Rest Model"
                    addProductModel = component "Add Product Model" "Provide cached data model of product by admin" "ASP.NET Core Rest Model"

                    service = component "Service" "Handing when called" "ASP.NET Core Rest Service" 

                    sliderController = component "Slider Controller" "Provide API interface Slider" "ASP.NET Core Rest Controller"
                    sliderModel = component "Silder Model"  "Provide data model of Slider and interface to database" "ASP.NET Core Rest Model"
                    addSliderModel = component "Add Silder Model"  "Provide cached data model of Slider" "ASP.NET Core Rest Model"

                    newController = component "New Controller" "Provide API interface News" "ASP.NET Core Rest Controller"
                    newModel = component "New Model" "Provide data model of News and interface to database" "ASP.NET Core Rest Model"
                    addNewModel = component "Add New Model" "Provide cached data model of News" "ASP.NET Core Rest Model"
                }
                database = container "Database" "Stores data customer states" "SQL Server 2019" "Database"
                
            }
        }
        // User login
        loginUserView -> loginUserController "Makes API calls to " HTTP
        loginUserController -> service "Mapping Route Login"
        service -> customerModel "Call model Customer"
        service -> loginModel "Call model Login"
        customerModel -> database "Read from and Write to"

        // Admin Login
        loginAdminView -> loginAdminController "Makes API calls to " HTTP
        loginAdminController -> service "Mapping Route Login"
        service -> adminModel "Call Model Admin"
        adminModel -> database "Read from and Write to"

        // User Update Profile
        customerProfileDetail -> customerController "Makes API calls to " HTTP
        customerController -> service "Mapping Route get and update customer profile by Id"
        customerController -> service "Mapping Route get all customer"
        customerController -> service "Mapping Route delete customer by customerId"
        service -> customerModel "Call Model Customer"
        customerModel -> database "Read from and Write to"

        // Register User
        registerCustomerView -> customerController "Makes API calls to " HTTP
        customerController -> service "Mapping Route Post Customer"
        service -> customerModel "Call Model Customer"
        service -> addCustomerModel "Call Model Add Customer"
        customerModel -> database "Read from and Write to"

        // Cart Detail Get byID
        cartDetailView -> cartController "Makes API calls to " HTTP
        cartController -> service "Mapping Route get Cart By Customer ID"
        cartController -> service "Mapping Route get All Cart"
        cartController -> service "Mapping Route delete Cart By Customer ID"
        service -> cartModel "Call Model Cart"
        cartModel -> database "Read from and Write to"

        // Add Cart
        productDetailView -> cartController "Makes API calls to " HTTP
        cartController -> service "Mapping Route Add Cart"
        service -> addCartModel "Call Model Add Cart"

        // Detail Bill
        billDetailView -> billController "Makes API calls to " HTTP
        billController -> service "Mapping Route get Bill By Customer ID"
        service -> billModel "Call"
        billModel -> database "Read from and Write to"

        // Add Bill
        checkOutView -> billController "Makes API calls to " HTTP
        billController -> service "Mapping Route Add Bill"
        service -> addBillModel "Call"

        // Get All Bill
        billManageView -> billController "Makes API calls to " HTTP
        billController -> service "Mapping Route Get All Bill"

        // Delete Bill By ID
        billController -> service "Mapping Route Delete Bill By ID"

        // Detail Product
        productDetailView -> productController "Makes API calls to " HTTP
        productController -> service "Mapping Route Get Product By ID"
        service -> productModel "Call Model Product"
        productModel -> database "Read from and Write to"

        // Add Product
        productManageView -> productController "Makes API calls to " HTTP
        productController -> service "Mapping Route Add Product"
        service -> addProductModel "Call Model Add Product"

        // View Product
        productController -> service "Mapping Route Get All Product"

        // Delete Product 
        productController -> service "Mapping Route Delete Product By ID"
        
        // Update Product 
        productController -> service "Mapping Route Update Product By ID"

        // Get all Slider in web application
        homeView -> sliderController "Makes API calls to " HTTP
        sliderController -> service "Mapping Route Get All Slider"
        service -> sliderModel "Call Model Slider"
        sliderModel -> database "Read from and Write to"

        // Add Slider
        sliderManageView -> sliderController "Makes API calls to " HTTP
        sliderController -> service "Mapping Route Add Slider"
        service -> addSliderModel "Call Model Add Slider"

        // Get Slider by Id
        sliderController -> service "Mapping Route Get Slider By Id"

        // Delete Slider
        sliderController -> service "Mapping Route Delete Slider"
        
        // Update Slider
        sliderController -> service "Mapping Route Update Slider By Id"

        // Get all New in web application
        homeView -> newController "Makes API calls to " HTTP
        newController -> service "Mapping Route Get All News"
        service -> newModel "Call Model Slider"
        newModel -> database "Read from and Write to"

        // Add New
        newManageView -> newController "Makes API calls to " HTTP
        newController -> service "Mapping Route Add New"
        service -> addNewModel "Call Model Add New"

        // Get New by Id
        newController -> service "Mapping Route Get New By Id"

        // Delete New
        newController -> service "Mapping Route Delete New"
        
        // Update New
        newController -> service "Mapping Route Update New By Id"
    }
    views {
        component apiApplication "LoginComponentUser"{
            include  loginUserView loginUserController service customerModel loginModel database
            autoLayout
        }
        component apiApplication "LoginComponentAdmin"{
            include loginAdminView loginAdminController service adminModel loginModel database
            autoLayout
        }
        component apiApplication "UpdateProfileUserComponent"{
            include customerProfileDetail customerController service customerModel database
            autoLayout
        }
        component apiApplication "AddCustomerComponent"{
            include registerCustomerView customerController service customerModel addCustomerModel database
            autoLayout
        }
        component apiApplication "GetAllProfileUserComponent"{
            include customerProfileDetail customerController service customerModel database
            autoLayout
        }
        component apiApplication "DeleteCustomerComponent"{
            include customerProfileDetail customerController service customerModel database
            autoLayout
        }
        component apiApplication "GetCartByIDComponent" {
            include cartDetailView cartController service cartModel database
            autoLayout
        }
        component apiApplication "GetAllCartComponent" {
            include cartDetailView cartController service cartModel database
            autoLayout
        }
        component apiApplication "DeleteCartByIDComponent" {
            include cartDetailView cartController service cartModel database
            autoLayout
        }
        component apiApplication "AddCartComponent" {
            include productDetailView cartController service cartModel addCartModel database
            autoLayout
        }
        component apiApplication "DetailBillComponent" {
            include billDetailView billController service billModel database
            autoLayout
        }
        component apiApplication "GetAllBillComponent" {
            include billManageView billController service billModel database
            autoLayout
        }
        component apiApplication "DeleteBillComponent" {
            include billManageView billController service billModel database
            autoLayout
        }
        component apiApplication "AddBillComponent" {
            include checkOutView billController service billModel addBillModel database
            autoLayout
        }
        component apiApplication "DetailProductComponent" {
            include productDetailView productController service productModel database
            autoLayout
        }
        component apiApplication "GetAllProductComponent" {
            include productManageView productController service productModel database
            autoLayout
        }
        component apiApplication "DeleteProductComponent" {
            include productManageView productController service productModel database
            autoLayout
        }
        component apiApplication "UpdateProductComponent" {
            include productManageView productController service productModel database
            autoLayout
        }
        component apiApplication "AddProductComponent" {
            include productManageView productController service productModel addProductModel database
            autoLayout
        }
        component apiApplication "GetAllSliderComponent"{
            include homeView sliderController service sliderModel database
            autoLayout
        }
        component apiApplication "GetSliderByIdComponent"{
            include sliderManageView sliderController service sliderModel database
            autoLayout
        }
        component apiApplication "DeleteSliderByIdComponent"{
            include sliderManageView sliderController service sliderModel database
            autoLayout
        }
        component apiApplication "UpdateSliderByIdComponent"{
            include sliderManageView sliderController service sliderModel database
            autoLayout
        }
        component apiApplication "AddSliderComponent"{
            include sliderManageView sliderController service sliderModel addSliderModel database
            autoLayout
        }
        component apiApplication "GetAllNewsComponent"{
            include homeView newController service newModel database
            autoLayout
        }
        component apiApplication "GetNewByIdComponent"{
            include homeView newController service newModel database
            autoLayout
        }
        component apiApplication "DeleteNewByIdComponent"{
            include homeView newController service newModel database
            autoLayout
        }
        component apiApplication "UpdateNewByIdComponent"{
            include homeView newController service newModel database
            autoLayout
        }
        component apiApplication "AddNewComponent"{
            include newManageView newController service newModel addnewModel database
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
                background #08427b
                color #ffffff
            }
            element "Database"{
                shape Cylinder
            }
            element "Component" {
                background #438dd5
                color #000000
            }

        }
    }
}