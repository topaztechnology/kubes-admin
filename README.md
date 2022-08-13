# Kubes admin image

## Overview

An image that can be used for testing cluster behaviour, including:

* Networking tools
* DNS tools
* SMB tools
* Postgres client & contrib (for pgbench)
* SQL Server client
* Oracle client & sqlplus

## Usage

```
kubectl run kubes-admin --rm -it --image topaztechnology/kubes-admin:latest -- bash
```
