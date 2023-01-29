
classdef TestRunner

	properties
		testFiles;
	end


	methods(Static)
		function testStatus = runAllTests()
			testFiles = [
				cross_deriv_tests(), 
				deriv2d_tests(),
				doubleDeriv2d_tests(),
				enlarge_array_tests(),
				filter2d_tests(),
				floorProfile_tests(),
				initialCondition_tests(),
				profileDescription_tests(),
				solve_for_u_tests(),
				solve_fro_v_tests(),
				tridiagonal_matrix_tests(),
				tridiagonal_tests(),
				u_coeff_matrices_tests(),
				v_coeff_matrice_tests()
			];

			for testFileObject = testFiles
				testStatus = testFileObject.runAllUnitTests();
			end
		end
	end
end