# MoMo Transaction API - Endpoint Documentation

## Base Information
- **Base URL:** `http://localhost:8000`
- **Authentication:** Basic Authentication (admin:secret)
- **Content-Type:** `application/json`
- **Response Format:** JSON

---

## 1. GET /transactions - Retrieve All Transactions

### Endpoint & Method
- **Method:** `GET`
- **URL:** `/transactions`
- **Authentication:** Required (Basic Auth)

### Description
Retrieves a list of all mobile money transactions in the system.

### Request Example
```http
GET http://localhost:8000/transactions
Authorization: Basic YWRtaW46c2VjcmV0
```

