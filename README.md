# Laravel + Bagisto E-commerce API

##   Project Objective
This project is a lightweight e-commerce backend built using Laravel and the Bagisto framework. It exposes essential e-commerce operations via REST APIs such as categories, products, cart, and checkout processes.

This project was developed in response to a Laravel Developer Assessment task.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/bagisto-ecommerce-api.git
cd bagisto-ecommerce-api


2. Install Dependencies
composer install
npm install && npm run dev

3. Environment Configuration
Configure your database settings in the .env file:
DB_DATABASE=your_database_name
DB_USERNAME=your_db_username
DB_PASSWORD=your_db_password


4.Run the Application
php artisan serve
Now visit: http://127.0.0.1:8000

API Endpoints (Custom & Bagisto)

Categories
GET /api/categories – All categories (Bagisto default)
GET /api/categories/short – Filtered category list (custom)

Products
GET /api/products – All products (Bagisto default)
GET /api/products/short – Filtered product list (custom)

Customer
POST /api/customer/login
{
  "email": "zafarhusain.husain02@gmail.com",
  "password": "123456"
}

Cart
POST /api/checkout/cart
{
  "product_id": 3,
  "quantity": 2
}

Checkout Flow
Billing/Shipping Address
POST /api/checkout/onepage/addresses (Bearer Token Required)

Shipping Method
POST /api/checkout/onepage/shipping-methods (Bearer Token Required)
{
  "shipping_method": "flatrate_flatrate"
}

Payment Method
POST /api/checkout/onepage/payment-methods (Bearer Token Required)
{
  "payment": {
    "method": "cashondelivery"
  }
}


Place Order
POST /api/checkout/onepage/orders (Bearer Token Required)
{}


Admin Panel Access
URL: http://127.0.0.1:8000/admin/login
Email: mcazafar@gmail.com
Password: zafar1212


Deliverables
 Laravel project
 .env file (with sensitive info removed)
 SQL dump of the database
 Postman Collection with all working APIs
 README with complete instructions
 
Notes
 Bagisto's default APIs were reused where possible.
 Custom API routes (/short) were added for simplified output.
 Authentication and token-based access were tested and verified.
 Sample categories, products, and invoice generation were successfully done via the admin panel.
 
 
Zafar Husain
Email: mcazafar@gmail.com
GitHub: [your-github-profile-link]