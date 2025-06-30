clear all
format shortEng
format compact

% Define new colors as per your request
Colors = {'#FF00FF', '#00FF00', '#000080', '#FFA500'}; % Magenta, Green, Navy Blue, Orange

h=0.1;
Lambda=1.139425534473202e+03;
beta=1.907e-06;
epsilon=0.25;
mu=0.5669;
mu_0=0.2;
alpha=0.5; %0.333;
p_0=0.28555;
p_max=0.74; %0.45584;
delta_vect=[0.001 0.202 0.657 0.999];
xi=0.90;%0.296;
gamma=0.1054; %0.016044;
eta=0.03974;

% Create legends
Legends=compose('gamma: %0.3f',delta_vect);

Markers = ['o', 'o', 'o', 'o']; 
MarkerSizes = [5, 5, 5, 5]; 
LineStyles = {'-', '--', ':', '-.'}; 

for i = 1:length(delta_vect)
    delta = delta_vect(i);
    out = sim('Opt_Cntrl_ver1_US.slx'); 
    markerSize = MarkerSizes(i);
    figure;  
    hold on
    
    % Plot each output with uncommon color and marker
    plot(out.simout.time.Data, out.simout.I1.Data, 'LineWidth', 5, 'Color', Colors{1}, "Marker", Markers(i), "MarkerIndices", 1:10:length(out.simout.I1.Data), "MarkerSize", markerSize);
    plot(out.simout.time.Data, out.simout.I2.Data, 'LineWidth', 5, 'Color', Colors{2}, "Marker", Markers(i), "MarkerIndices", 1:10:length(out.simout.I2.Data), "MarkerSize", markerSize);
    plot(out.simout.time.Data, out.simout.T.Data, 'LineWidth', 5, 'Color', Colors{3}, "Marker", Markers(i), "MarkerIndices", 1:10:length(out.simout.T.Data), "MarkerSize", markerSize);
    plot(out.simout.time.Data, out.simout.A.Data, 'LineWidth', 5, 'Color', Colors{4}, "Marker", Markers(i), "MarkerIndices", 1:10:length(out.simout.A.Data), "MarkerSize", markerSize);
    
    % Format plot aesthetics
    ax = gca;
    ax.FontSize = 30;
    ax.LineWidth = 5;
    xlabel('Time (Years)');
    ylabel('The number of individuals');
    xlim([2000 2030]);
    xticks(2000:10:2030);
    ylim([0 16*10^6]);
    yticks(0:4*10^6:16*10^6)
    legend({'I_1', 'I_2', 'T', 'A'});
    box off
    
    % Add title with the current delta value
    %title(sprintf('gamma: %.2f', delta), 'FontSize', 32);
    hold off
end