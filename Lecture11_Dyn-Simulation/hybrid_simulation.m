close all; clc; clear;         % prepare workspace and command window

t0 = 0; tf = 10;                    % define simulation initial and final times
z0 = [10;0];                        % define initial conditions
g = 9.81; COR = 0.8;   % define parameters
p = [g; COR];

sols = [];          % initialize array of solution structures. The results 
                    % of different phases (bounces) will be stored as 
                    % separate elements in the array. 

% The dynamics function passed to ode45 must have input arguments (t,z)
% only, so return an function handle to an anonymous function that accepts 
% only inputs (t,z), but actually evaluates the continuous dynamics 
% function with all inputs (t,z,p)
f = @(t,z) dynamics_continuous(t, z, p);

% Set integration tolerances and event conditions.  Note that an anonymous
% function is used to pass parameters p into the event conditions function.
inttol = 1e-9;                      % define integration tolerances
opts = odeset('Events', @(t,z) event_conditions(t,z,p), 'abstol',inttol,'reltol',inttol);

t_initial = t0;
while(t_initial < tf)      % while integration start time is less than simulation end time    
    
    % numerically integrate dynamics from integration start time and
    % initial conditions until simulation end time OR until terminal event
    % set in opts structure.
    sol = ode45(f, [t_initial tf], z0, opts);  
    t_initial = sol.x(end);                    % set new integration start time
     
    % if integration terminated due to an event, determine the state after
    % the discrete dynamics, which is the new initial state.
    if isfield(sol,'ie') && ~isempty(sol.ie)
        z0 = dynamics_discrete(sol.ye(:,end),p);
    else
        % otherwise, add fields to the options structure in case they 
        % aren't already there, because all structures in an array of 
        % structures must have identical fields.
        sol.ie = []; sol.xe = []; sol.ye = [];
    end
    
    % add solution structure to array of solution structures
    sols = [sols; sol];
end

% assemble output time and state arrays from information in array of
% solution structures
tout = []; zout = [];           % initialize output time and state arrays
tout_fine = []; zout_fine = []; % initialize fine grid time and state arrays

for ii = 1:length(sols)
    tout = [tout sols(ii).x];   % concatenate time array
    zout = [zout sols(ii).y];   % concatenate state array
    
    % ode45 may return the solution at a sparse set of times, but
    % we can postprocess the solution structure to return the state on a
    % finer time grid using deval().
    dt = .01;                                   % time increment
    tgrid = sols(ii).x(1):dt:sols(ii).x(end);   % time grid
    zgrid = deval(sols(ii),tgrid);              % state at each time point
    tout_fine = [tout_fine tgrid];              % concatenate time array
    zout_fine = [zout_fine zgrid];              % concatenate state array
end


%%
dt = 0.01;                         % define time step
num_step = floor(tf/dt);
[tout_euler, zout_euler] = ball_bouncing_simulation([10;0], dt, num_step, p, false);
[tout_euler_semi, zout_euler_semi] = ball_bouncing_simulation([10;0], dt, num_step, p, true);


%% Plot trajectory of first state element through time
hold on
% plot(tout,zout(1,:)); 
plot(tout_fine,zout_fine(1,:));
plot(tout_euler, zout_euler(1,:))
plot(tout_euler_semi, zout_euler_semi(1,:))
plot([t0, tf], [0, 0], 'k', 'linewidth',2)
xlabel('Time (s)');
ylabel('Ball Height (m)');
% legend('Solution at ode45-selected time points','Solution evaluated on fine grid')
legend('Solution of ode45','Euler Integration', 'Semi Implicit Euler')
title('Ball Height as a Function of Time');


%%
%% Ball Bounding Simulation

function [t, z] = ball_bouncing_simulation(z0, dt, num_step, p, semi_implicit)
    z = zeros(2,num_step);
    t = zeros(1, num_step);
    z(:,1) = z0;

    for i = 1:num_step-1
        current_state = z(:,i);
        dz = dynamics_continuous(t, current_state, p);
        if(semi_implicit)
            % Semi Implicit Euler integration
            z(2, i+1) = current_state(2) + dz(2)*dt;
            z(1, i+1) = current_state(1) + z(2,i+1)*dt;
        else
            % Explicit Euler integration
            z(:, i+1) = current_state + dz*dt;
        end
        
        if (z(1,i+1)<0)
            z(2,i+1) = -z(2,i+1)*p(2);
            z(1,i+1) = 0;
        end
        t(i+1) = i*dt;
    end
end
