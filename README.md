# Kubes admin image with postgres tools

## Overview

An image that can be used for testing cluster behaviour, including

* IP tools
* DNS tools
* SMB tools
* Postgres client & contrib (for pgbench)

## Usage

```
kubectl run kubes-admin --rm -it --image topaztechnology/kubes-admin:latest -- bash
```