# PaymentService Class

{{copyright}}

**Group** Billing

## Methods
### `calculateInstallment(totalAmount, frequency)`

총 결제 금액을 회차로 나눈다.

#### Signature
```apex
public static Decimal calculateInstallment(Decimal totalAmount, Integer frequency)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| totalAmount | Decimal | 전체 금액 |
| frequency | Integer | 회차 |

#### Return Type
**Decimal**

각 회차 금액