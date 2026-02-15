clc; clear; close all;

%% ----------------- Aircraft Configurations -----------------
aircraft(1).name = 'Aircraft A'; aircraft(1).S = 30;  aircraft(1).W = 60000; aircraft(1).AR = 8; aircraft(1).e = 0.8;  aircraft(1).CD0 = 0.02;
aircraft(2).name = 'Aircraft B'; aircraft(2).S = 28;  aircraft(2).W = 55000; aircraft(2).AR = 9; aircraft(2).e = 0.85; aircraft(2).CD0 = 0.021;
aircraft(3).name = 'Aircraft C'; aircraft(3).S = 32;  aircraft(3).W = 65000; aircraft(3).AR = 7.5; aircraft(3).e = 0.78; aircraft(3).CD0 = 0.019;

colors = {'b','r','g'};            % Color per aircraft
styles = {'-','--','-.',':','-.'}; % Line styles for altitudes
altitudes = [0, 2000, 5000, 10000, 15000]; % High-altitude extension
V = linspace(30,120,50);                   % Velocity range (m/s)
g = 9.81;                                  % Gravity

outputFolder = '../figures';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

%% ----------------- Multi-Aircraft Thrust & Power Required -----------------
figure('Color','w','Position',[100 100 900 550]);
tiledlayout(1,2,'TileSpacing','compact','Padding','compact');

% LEFT: Thrust Required
nexttile; hold on;
for j = 1:length(aircraft)
    S = aircraft(j).S; W = aircraft(j).W; AR = aircraft(j).AR;
    e = aircraft(j).e; CD0 = aircraft(j).CD0; k = 1/(pi*AR*e);

    for i = 1:length(altitudes)
        [~,~,rho_i] = isa_atmosphere(altitudes(i));
        CL_i = W ./ (0.5 * rho_i .* V.^2 * S);
        CD_i = CD0 + k*CL_i.^2;
        [~, D_i] = lift_drag(rho_i, V, S, CL_i, CD_i);
        Treq_i = thrust_required(D_i);

        plot(V, Treq_i,'Color',colors{j},...
             'LineStyle',styles{i},'LineWidth',2.2);
    end
end
xlabel('Velocity (m/s)','FontWeight','bold'); ylabel('Thrust Required (N)','FontWeight','bold');
title('Thrust Required vs Velocity','FontWeight','bold'); grid on;
legend('A SL','A 2km','A 5km','A 10km','A 15km', ...
       'B SL','B 2km','B 5km','B 10km','B 15km', ...
       'C SL','C 2km','C 5km','C 10km','C 15km', 'Location','northwest');
set(gca,'FontSize',12,'LineWidth',1.2);

% RIGHT: Power Required
nexttile; hold on;
for j = 1:length(aircraft)
    S = aircraft(j).S; W = aircraft(j).W; AR = aircraft(j).AR;
    e = aircraft(j).e; CD0 = aircraft(j).CD0; k = 1/(pi*AR*e);

    [~,~,rho_sl] = isa_atmosphere(0);
    CL_sl = W ./ (0.5 * rho_sl .* V.^2 * S);
    CD_sl = CD0 + k*CL_sl.^2;
    [~, D_sl] = lift_drag(rho_sl, V, S, CL_sl, CD_sl);
    Treq_sl = thrust_required(D_sl);
    Preq = Treq_sl .* V;

    plot(V, Preq,'Color',colors{j},'LineWidth',2.5)
    [Pmin, idxP] = min(Preq);
    V_endurance = V(idxP);
    plot(V_endurance, Pmin,'*','Color',colors{j},'MarkerSize',10,'LineWidth',1.5);
end
xlabel('Velocity (m/s)','FontWeight','bold'); ylabel('Power Required (W)','FontWeight','bold');
title('Power Required & Endurance Condition','FontWeight','bold'); grid on;
set(gca,'FontSize',12,'LineWidth',1.2);

% Save figure
exportgraphics(gcf, fullfile(outputFolder,'aircraft_performance_multi_aircraft.png'),'Resolution',300);

%% ----------------- Multi-Aircraft Drag Polar -----------------
figure('Color','w','Position',[100 100 600 400]); hold on;
for j = 1:length(aircraft)
    S = aircraft(j).S; W = aircraft(j).W; AR = aircraft(j).AR;
    e = aircraft(j).e; CD0 = aircraft(j).CD0; k = 1/(pi*AR*e);

    [~,~,rho_sl] = isa_atmosphere(0);
    CL_sl = W ./ (0.5 * rho_sl .* V.^2 * S);
    CD_sl = CD0 + k*CL_sl.^2;
    plot(CL_sl, CD_sl,'LineWidth',2)
end
grid on; box on
xlabel('Lift Coefficient (C_L)','FontWeight','bold'); ylabel('Drag Coefficient (C_D)','FontWeight','bold');
title('Drag Polar Comparison','FontWeight','bold');
legend({aircraft.name}); set(gca,'FontSize',12,'LineWidth',1.2);

exportgraphics(gcf, fullfile(outputFolder,'drag_polar_multi.png'),'Resolution',300);

%% ----------------- Take-Off & Climb Performance -----------------
figure('Color','w','Position',[100 100 600 400]); hold on;

CLmax = 1.5;          % Max lift coefficient for take-off
T_avail = 70000;      % Available thrust (N)

[~,~,rho_sl] = isa_atmosphere(0);

for j = 1:length(aircraft)
    S = aircraft(j).S; W = aircraft(j).W; AR = aircraft(j).AR;
    e = aircraft(j).e; CD0 = aircraft(j).CD0; k = 1/(pi*AR*e);

    CL_sl = W ./ (0.5 * rho_sl .* V.^2 * S);
    CD_sl = CD0 + k*CL_sl.^2;
    [~, D_sl] = lift_drag(rho_sl, V, S, CL_sl, CD_sl);
    Treq_sl = thrust_required(D_sl);

    % Rate of climb
    RC = (T_avail - D_sl)./W .* V;

    yyaxis left
    plot(V, RC,'LineWidth',2)
    ylabel('Rate of Climb (m/s)')

    yyaxis right
    plot(V, Treq_sl,'LineWidth',2)
    ylabel('Thrust Required (N)')
end
xlabel('Velocity (m/s)'); title('Take-Off & Climb Performance','FontWeight','bold'); grid on;
legend({aircraft.name}); set(gca,'FontSize',12,'LineWidth',1.2); box on

exportgraphics(gcf, fullfile(outputFolder,'takeoff_climb.png'),'Resolution',300);
