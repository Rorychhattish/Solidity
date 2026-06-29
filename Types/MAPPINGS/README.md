# Mappings in Solidity

Mappings are an important data type in Solidity. They allow us to associate (map) one data type with another.

## Syntax

```solidity
mapping(KeyType => ValueType) variableName;
```

Example:

```solidity
mapping(address => uint) balances;
```

This mapping stores a `uint` balance for each Ethereum address.

---

## Example Scenario

Suppose we want to track account balances.

| Address | Balance |
|----------|---------|
| 0xc783df8a850f42e7F7e57013759C285caa701eB6 | 500 |
| 0xeAD9C93b79Ae7C1591b1FB5323BD777E86e150d4 | 100 |
| 0xE5904695748fe4A84b40b3fc79De2277660BD1D3 | 20 |

### Using Structs and Arrays

```solidity
struct Account {
    address addr;
    uint balance;
}

Account[] accounts;
```

To find a user's balance, we would need to loop through the entire array until we find the matching address.

This approach works but is inefficient for large datasets.

---

## Using Mappings

A better solution is:

```solidity
mapping(address => uint) balances;
```

Now each address directly maps to its balance.

Example:

```solidity
balances[msg.sender] = 1000;
```

Retrieve balance:

```solidity
uint userBalance = balances[msg.sender];
```

---

## Complete Example

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    mapping(address => uint) public balances;

    function deposit(uint amount) external {
        balances[msg.sender] += amount;
    }

    function getBalance(address user) external view returns(uint) {
        return balances[user];
    }
}
```

---

## Advantages of Mappings

- Fast data lookup.
- No need to iterate through arrays.
- Efficient storage and gas usage.
- Each key maps directly to a value.

---

## Important Points

- Keys in a mapping are unique.
- Mappings cannot be iterated over.
- Mappings do not store keys; only values are stored.
- Uninitialized keys return default values.

Example:

```solidity
mapping(address => uint) balances;
```

If an address has not been assigned a value:

```solidity
balances[someAddress];
```

returns:

```solidity
0
```

---

## When to Use Mappings

Use mappings when:

- You need fast lookups.
- You want to associate one value with another.
- Iteration is not required.

Examples:

- Token balances
- Voting systems
- User profiles
- Permissions and roles
- Ownership tracking

---

## Summary

Mappings are one of the most commonly used and efficient data structures in Solidity. They provide constant-time lookups and are ideal for storing relationships between keys and values, such as addresses and balances.