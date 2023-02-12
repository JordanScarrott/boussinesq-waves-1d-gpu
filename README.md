# boussinesq-waves-1d

## Running the simulation
To run the simulation you can call the functions with the Boussinesq.m file.
Here is an example command to generate results for a driven input with a Flat floor profile.

Define and initialize all initial data before the simulation starts running:
`1. A = Boussinesq([100, 0.01, 0.045, 0.45, 0.1, 0.05, 400, FloorProfile.FLAT, InitialCondition.EXPONENTIAL]);`

Run the Adams-Bashfourth Predictor-Corrector code to iteratively solve the Boussinesq equation:
`2. A = A.solve();`

Show the results over time using an optimized data plot:
`3. A = A.displayMeshes();`

It is important that you assign the results of all commands to the same variable (A).

## Data exporting and importing
Boussinesq.m also allows you to export the parameters used to generate your results. For every set of successfully generated results you should do an export. This can be stored with any other export data like images to be used in your thesis. You should also store all the code you used to generate it using a zip file.

`A = A.saveParamData()`

To recreate a set of results, you can import this exported data using the following:

`A = A.loadPresetFromFile()`


## Test Suite

This code base uses a custom test suite I have built from the ground up.

All tests are configured and run from the file called **TestRunner.m** using the command `status = TestRunner.runAllTests()`.

Each code file in this repository should have an associated test file with the following naming convention: *file.m -> File_tests.m*.

Each test file must be registered in **TestRunner.m** and have its own constructor function. Each test file should also contain a function called `runAllUnitTests()`. These two functions will be called to return object instances of each test class and then run all their test functions.
