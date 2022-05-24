classdef BoundaryCondition

	properties
		Property1
	end

	methods(Static)
		% Handles the boundary condition for reflective boundaries
		% They are computed per side with the following equations
		% u.n = 0
		% grad n.normal_vector = 0
		% duT/dn = 0
		%
		% d is the depth of the boundary (how many cells deep is the boundary)

		% Not sure of the first and last boundary conditions. For the first BC I
		% swapped all the u.us with u.vs and vice versa
		function [n_,u_] = reflective_boundary(n,u)
			n_ = n;
			u_ = u;

			d = 1;
			b = [48; -36; 16; -3];
			p = length(b);

			% Computed per side (left,right,up,down)
			% Left side
			n_(d:end-d+1,1) = (n(d:end-d+1,2:p+1) * b)/25;

			% Right side
			n_(d:end-d+1,end) = (n(d:end-d+1,end-p:end-1) * b(end:-1:1))/25;
		end


		% Sets k many rows and columns at the borders of n to the same as k+1
		% within the border

		% All +'s will be the same as x when k==2
		% ++++++++++++++++++++
		% ++++++++++++++++++++
		% ++xxxxxxxxxxxxxxxx++
		% ++x--------------x++
		% ++x--------------x++
		% ++x--------------x++
		% ++x--------------x++
		% ++xxxxxxxxxxxxxxxx++
		% ++++++++++++++++++++
		% ++++++++++++++++++++

		function n = constant_boundary(n, k)
			for i=k:-1:1
				n(:,i) = n(:,i+1);
				n(:,end-(i-1)) = n(:,end-i);
				n(i,:) = n(i+1,:);
				n(end-(i-1),:) = n(end-i,:);
			end
		end


		% d is boundary depth
		% a is wave amplitude
		% t is current time
		function [n_,u_] = wavemaker_boundary(n, u, h0, t_curr, dt)
			n_ = n;
			u_ = u;
			d = 2;

            A0 = 0.0045;
            f = 1;
            wavelength = 1;
			% Math constants
			w = 2 * pi * f;
			k = 2 * pi / wavelength;
			a = -0.390;


			% Wave elevation
			n_(1:d) = A0 * sin(w*(t_curr+(d-1)*dt:-dt:t_curr));
			
			% The correct wave speed for this elevation
			coeff = w / (k*h0*(1-(a+1/3)*(k*h0)^2));
			
			% w*t gives you the radians rotated in t units of time
			u_ = coeff * n_;
		end

	end

end