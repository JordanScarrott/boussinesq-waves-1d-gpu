classdef Deriv2d_tests

	properties
		args;
		status;
		u_data;
	end

	methods
		function obj = Deriv2d_tests(args)
			obj.args = args;
			obj.status = false;

			% Test data
			obj.u_data = [
				1 ,  3,  5,  7,  9;
				11, 13, 15, 17, 19;
				21, 23, 25, 27, 29;
				31, 33, 35, 37, 39;
			];
		end


		% Tests %
		function status = runAllUnitTests(obj)

			tests = [
				obj.testDeriv2dX,
				obj.testDeriv2dY
			];

			testNames = [
				"deriv2d in X direction\n",
				"deriv2d in Y direction\n"
			];


			for i = 1:numel(tests)
				test = tests(i);
                status = test();

				if (status == false)
					fprintf(2, testNames(i));
					break;
				else 
					fprintf(1, testNames(i));
				end
			end
		end

		% deriv2d in X direction %
		function status = testDeriv2dX(obj)
			direction = 1;
			delta = 0.5;

			expectedResult = [
				4, 4, 4, 4, 4
				4, 4, 4, 4, 4
				4, 4, 4, 4, 4
				4, 4, 4, 4, 4
			];

			result = deriv2d(obj.u_data, direction, delta);

			TestRunner.assertEqual(result, expectedResult);
			status = true;
		end

		% deriv2d in Y direction %
		function status = testDeriv2dY(obj)
			direction = 2;
			delta = 0.05;

			expectedResult = [
				200, 200, 200, 200, 200
				200, 200, 200, 200, 200
				200, 200, 200, 200, 200
				200, 200, 200, 200, 200
			];

			result = deriv2d(obj.u_data, direction, delta);

			TestRunner.assertEqual(result, expectedResult);
			status = true;
		end
	end
end