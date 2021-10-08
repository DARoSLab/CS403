function zp = dynamics_discrete(zm,p)
% Evaluates the discrete dynamics
%
% Inputs
% zm    z-minus - state before impact
% p     parameters
%
% Outputs 
% zp    z-plus - state after impact

    % Get the coefficient of restitution
    COR = p(2);
    
    % Height stays the same
    zp(1) = zm(1);
    
    % Vertical speed after impact changes instantaneously
    zp(2) = -zm(2)*COR;

end