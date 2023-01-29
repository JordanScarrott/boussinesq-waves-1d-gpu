
classdef TestRunner

	properties
		testFiles;
	end


	methods(Static)
		function testStatus = runAllTests()
			testFiles = [
% 				cross_deriv_tests(), 
				Deriv2d_tests(1),
% 				doubleDeriv2d_tests(),
% 				enlarge_array_tests(),
% 				filter2d_tests(),
% 				floorProfile_tests(),
% 				initialCondition_tests(),
% 				profileDescription_tests(),
% 				solve_for_u_tests(),
% 				solve_fro_v_tests(),
% 				tridiagonal_matrix_tests(),
% 				tridiagonal_tests(),
% 				u_coeff_matrices_tests(),
% 				v_coeff_matrice_tests()
			];

			for testFileObject = testFiles
				testStatus = testFileObject.runAllUnitTests();
			end
        end

        function passed = assertEqual(arg1, arg2)
            equal = isequal(arg1, arg2);

            if (equal == true)
                passed = true;
            else
				fprintf(2, 'Arguments not equal: \n');
				disp(arg1);
				disp(arg2);
				st = dbstack;
				for i = 1:length(st)
					fprintf(['File: ' st(i).file ', Function: ' st(i).name ', Line: ' num2str(st(i).line) '\n']);
				end
            end
        end
	end
end