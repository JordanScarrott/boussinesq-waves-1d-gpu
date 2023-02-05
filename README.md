# boussinesq-waves-1d


## Test Suite

This code base uses a custom test suite I have built from the ground up.

All tests are configured and run from the file called **TestRunner.m** using the command `status = TestRunner.runAllTests()`.

Each code file in this repository should have an associated test file with the following naming convention: *file.m -> File_tests.m*.

Each test file must be registered in **TestRunner.m** and have its own constructor function. Each test file should also contain a function called `runAllUnitTests()`. These two functions will be called to return object instances of each test class and then run all their test functions.
