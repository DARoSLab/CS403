 function [value,isterminal,direction] = event_conditions(t,z,p)
% Evaluates the event conditions. 
%
% Inputs
% t     current time
% z     current state
% p     parameters
%
% Outputs 
% value         value of event condition
% isterminal    stop integration when event occurs? 1 if yes, 0 if no.
% direction     does direction of event matter? 0 if no, 1 if condition 
%               must be increasing, -1 if condition must be decreasing.

    % Apex occurs when vertical speed is zero
    value(1) = z(2);    % vertical speed
    isterminal(1) = 0;  % don't terminate integration
    direction(1) = -1;  % it's only apex if speed is decreasing 

    % Collision w/ Ground occurs when height is zero
    value(2) = z(1);    % height
    isterminal(2) = 1;  % if condition is satisfied, terminate integration
    direction(2) = -1;  % only detect bouncing from above
    
end