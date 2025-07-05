# Payment Status

Manages individual payment installments for an Order.

## API Name
`Payment_Status__c`

## Fields
### 납부 회차명

Name for the payment installment, e.g., &quot;Order-001 - Installment 1&quot;.

**API Name**

`Installment_Name__c`

**Type**

*Text*

---
### Order

**API Name**

`Order__c`

**Type**

*MasterDetail*

---
### 납부 금액
**Required**

The amount due for this specific installment.

**API Name**

`Payment_Amount__c`

**Type**

*Currency*

---
### 납부 기일
**Required**

The due date for this payment installment.

**API Name**

`Payment_Due_Date__c`

**Type**

*Date*

---
### 납부 상태
**Required**

Indicates the current status of the payment installment.

**API Name**

`Status__c`

**Type**

*Picklist*

#### Possible values are
* 미납
* 납부 완료
* 연체