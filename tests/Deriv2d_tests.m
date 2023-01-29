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

			obj.u_data = [
				1 ,  3,  5,  7,  9;
				11, 13, 15, 17, 19;
				21, 23, 25, 27, 29;
				31, 33, 35, 37, 39;
			];
		end


		% Tests %
		function status = runAllUnitTests(obj)
			status = testDeriv2dX(obj);
			status = testDeriv2dY(obj);
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
			delta = 0.5;

			expectedResult = [
				20, 20, 20, 20, 20
				20, 20, 20, 20, 20
				20, 20, 20, 20, 20
				20, 20, 20, 20, 20
			];

			result = deriv2d(obj.u_data, direction, delta);

			TestRunner.assertEqual(result, expectedResult);
			status = true;
		end
	end
end