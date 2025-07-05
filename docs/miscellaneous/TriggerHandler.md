# TriggerHandler Class
`virtual`

:

**Last** 

modified on  : 07-03-2025

**Last** 

modified by  : Hyowon Hong

**Author** : Hyowon Hong

## Fields
### `triggerOption`

#### Signature
```apex
public static triggerOption
```

#### Type
Trigger_Handler_Manager__mdt

---

### `triggerOptionMap`

#### Signature
```apex
public static triggerOptionMap
```

#### Type
Map&lt;String,Trigger_Handler_Manager__mdt&gt;

## Methods
### `setting(isExecuting, operationType)`

#### Signature
```apex
public void setting(Boolean isExecuting, TriggerOperation operationType)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| isExecuting | Boolean |  |
| operationType | TriggerOperation |  |

#### Return Type
**void**

---

### `execute(news, olds, newMap, oldMap)`

#### Signature
```apex
public virtual void execute(List<SObject> news, List<SObject> olds, Map<Id,SObject> newMap, Map<Id,SObject> oldMap)
```

#### Parameters
| Name | Type | Description |
|------|------|-------------|
| news | List&lt;SObject&gt; |  |
| olds | List&lt;SObject&gt; |  |
| newMap | Map&lt;Id,SObject&gt; |  |
| oldMap | Map&lt;Id,SObject&gt; |  |

#### Return Type
**void**