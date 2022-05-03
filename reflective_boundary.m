

% Handles the boundary condition for reflective boundaries
% They are computed per side with the following equations
% u.n = 0
% grad n.normal_vector = 0
% duT/dn = 0
%
% d is the depth of the boundary (how many cells deep is the boundary)



% Not sure of the first and last boundary conditions. For the first BC I
% swapped all the u.us with u.vs and vice versa
function [n_,u_] = reflective_boundary(n,u,d,dx)
    
    n_dims = size(n);

    n_ = n;
    u_ = u;

    d = 1;
    b = [48; -36; 16; -3];
    p = length(b);

    % Computed per side (left,right,up,down)
    % Left side
    n_(d:end-d+1,1) = (n(d:end-d+1,2:p+1) * b)/25;

    % Right side
    n_(d:end-d+1,end) = (n(d:end-d+1,end-p:end-1) * b)/25;

end



















