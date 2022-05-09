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
		function [n_,u_] = wavemaker_boundary(n,u,d,A,t_curr,dt)

			dims_n = size(n);

			n_ = n;
			u_ = u;
		%     d = 2;
				
			% Math constants
			h0 = 0.45;
			w = 1;
			k = 1;
			a = -0.390;
			
			c = 1;
			
			
			t = ((d-1:-1:0) * dt + t_curr) .* ones(dims_n(1),d);
			
			% Wave elevation
			n_(:,1:d) = A * sin(c*t);
			
			% The correct wave speed for this elevation
			coeff = (w)/(k*h0*(1-(a+1/3)*(k*h0)^2));
			
			u_.u(:,1:d) = coeff * n_(:,1:d).*cos(c*t);
			u_.v(:,1:d) = coeff * n_(:,1:d).*sin(c*t);
			
					

		end

	end

end