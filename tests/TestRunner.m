
classdef TestRunner

	properties
		testFiles;
	end


	methods(Static)
		function testStatus = runAllTests()
			testFiles = {
% 				cross_deriv_tests(1), 
				Deriv2d_tests(1),
				DoubleDeriv2d_tests(1),
% 				enlarge_array_tests(1),
% 				filter2d_tests(1),
% 				floorProfile_tests(1),
% 				initialCondition_tests(1),
% 				profileDescription_tests(1),
% 				solve_for_u_tests(1),
% 				solve_fro_v_tests(1),
% 				tridiagonal_matrix_tests(1),
% 				tridiagonal_tests(1),
% 				u_coeff_matrices_tests(1),
% 				v_coeff_matrice_tests(1)
			};

			% Run all tests for each test file
			for i = 1:length(testFiles)
				testFileObject = testFiles{i};
				testStatus = feval('runAllUnitTests', testFileObject);

				% testStatus = testFileObject.runAllUnitTests();
			end
        end

        function passed = assertEqual(arg1, arg2)
            equal = isequal(arg1, arg2);

            if (equal == true)
                passed = true;
            else
				fprintf(2, 'Arguments not equal: \n');
				disp('Result:');
				disp(arg1);
				disp('Expected result:');
				disp(arg2);
				st = dbstack;
				for i = 1:length(st)
					fprintf(['File: ' st(i).file ', Function: ' st(i).name ', Line: ' num2str(st(i).line) '\n']);
				end
            end
        end
	end
end