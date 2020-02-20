# trivial-pis-dependency-aggregator
A complementary function for package-inferred-system

## Synopsis

This package provides functions to make dependencies over specific directory for package-inferred-system.

In package-inferred-system, dependencies to compile files are defined by `:use` or `:import-from` clauses in package definition.

However, in specific case, there's no other package depends on package, making no `:use` nor `:import-from`, even if it should be compiled.

`example/` illustrates typical routing definitions for Web application.
Each file defines HTTP controller in this example.
Each controller package are not depended on by any package.

Package-inferred-system does not compile package which is not reachable along dependency graph like this.

`trivial-pis-dependency-aggregator` generates super package which depends on all package under specified directory.
You can compile all package under specified directory, depending on generated super package.
