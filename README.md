# contract-template

Use this pre-configured template for smart contract projects.

Features:

- Truffle
- Ganache
- TypeScript
- TypeScript and Solidity auto-formatting
- TypeScript and Solidity code linting
- Solidity Test Coverage
- Slither

## Setup

Requirements:

- Node >= v12
- Yarn

```
$ npm i -g yarn       # Install yarn if you don't already have it
$ yarn install        # Install dependencies
$ yarn setup          # Setup Git hooks
```

## Linting and Formatting

To check code for problems:

```
$ yarn typecheck      # Type-check TypeScript code
$ yarn lint           # Check JavaScript and TypeScript code
$ yarn lint --fix     # Fix problems where possible
$ yarn solhint        # Check Solidity code
$ yarn slither        # Run Slither
```

To auto-format code:

```
$ yarn fmt
```

## TypeScript type definition files for the contracts

To generate type definitions:

```
$ yarn compile && yarn typechain
```

## Testing

First, make sure Ganache is running.

```
$ yarn ganache
```

Run all tests:

```
$ yarn test
```

To run tests in a specific file, run:

```
$ yarn test [path/to/file]
```

To run tests and generate test coverage, run:

```
$ yarn coverage
```

---

Copyright (c) 2020 Coinbase, Inc.
