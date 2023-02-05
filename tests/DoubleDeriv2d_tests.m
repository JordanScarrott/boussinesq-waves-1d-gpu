classdef DoubleDeriv2d_tests

	properties
		args;
		status;
		u_data;
	end

	methods
		function obj = DoubleDeriv2d_tests(args)
			obj.args = args;
			obj.status = false;

			% Test data
			obj.u_data = [
				1 ,  3,  5,  7,  9;
				11, 13, 15, 17, 19;
				31, 33, 35, 37, 39;
				61, 63, 65, 67, 69;
			];
		end


		% Tests %
		function status = runAllUnitTests(obj)

			% Define the array of test functions
			tests = [
				obj.testDoubleDeriv2dX,
				obj.testDoubleDeriv2dY
			];

			% Define a name for each test
			testNames = [
				"doublederiv2d in X direction",
				"doublederiv2d in Y direction"
			];


			% Run all tests
			fprintf(1, "\n\nDoubleDeriv2d_tests:\n");
			for i = 1:numel(tests)
				test = tests(i);
                status = test();

				if (status == false)
					fprintf(2, testNames(i) + ": Failed\n");
					break;
				else 
					fprintf(1, testNames(i) + ": Passed\n");
				end
			end
		end

		% deriv2d in X direction %
		function status = testDoubleDeriv2dX(obj)
			direction = 1;
			delta = 0.5;

			expectedResult = [
				0, 0, 0, 0, 0
				0, 0, 0, 0, 0
				0, 0, 0, 0, 0
				0, 0, 0, 0, 0
			];

			result = doublederiv2d(obj.u_data, direction, delta);

			TestRunner.assertEqual(result, expectedResult);
			status = true;
		end

		% deriv2d in Y direction %
		function status = testDoubleDeriv2dY(obj)
			direction = 2;
			delta = 1;

			expectedResult = [
				10, 10, 10, 10, 10
				10, 10, 10, 10, 10
				10, 10, 10, 10, 10
				10, 10, 10, 10, 10
			];

			result = doublederiv2d(obj.u_data, direction, delta);

			TestRunner.assertEqual(result, expectedResult);
			status = true;
		end
	end
end