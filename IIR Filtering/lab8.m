%% Lab 8
%% Design of Butterworth IIR Filters

figure
buttdes(1000, 2500, -3, -20, 20000)

figure
buttdes(1000, 1500, -3, -20, 20000)

figure
buttdes(1000, 1500, -3, -20, 10000)

figure
buttdes(1000, 1500, -3, -20, 5000)

%%The shape of the discrete-time analog-equivalent filter changes as the
%%sample rate chnges as it changes the amount of data the discrete-time
%%butterworth filter inputs into the filter. This is further evident in the
%%pole zero plot and the corresponding frequency vs response graphs. The
%%proximity of the values clustered on the right side of the plot
%%significantly differs based on the sample rate.