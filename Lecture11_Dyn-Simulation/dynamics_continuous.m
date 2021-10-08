function dz = dynamics_continuous(t,z,p)
% Evaluates the continuous dynamics
%
% Inputs
% t     current time
% z     state at current time
% p     parameters
%
% Outputs 
% dz    time derivative of the state vector at current time

% Assign relevant parameters to variables for easy of reading
g = p(1);

% y = z(1); % Element 1 of the state vector is height (not actually needed)
dy = z(2);  % Element 2 of the state vector is vertical speed

ddy = -g;  % evaluate the vertical acceleration

dz = [dy; ddy];  % time derivative of the state vector is speed and acceleration

end