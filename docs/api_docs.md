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

**cURL Command:**
```bash
curl -u admin:secret "http://localhost:8000/transactions"
```

### Response Example (200 OK)
```json
[
  {
    "transaction_id": "7666202170",
    "type": "receive",
    "amount": "2000",
    "sender": "Jane Smith",
    "receiver": null,
    "timestamp": "2024-05-10 16:30:51",
    "balance": "2000",
    "fee": null,
    "raw_body": "You have received 2000 RWF from Jane Smith (***********013) on your mobile money account at 2024-05-10 16:30:51. Message from sender: . Your new balance:2000 RWF."
  }
]
```

### Error Codes
- **200 OK:** Successfully retrieved transactions
- **401 Unauthorized:** Invalid or missing authentication credentials
- **500 Internal Server Error:** Server error occurred

---

