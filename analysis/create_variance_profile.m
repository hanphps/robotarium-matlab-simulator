function [] = create_variance_profile(data)

    sum_velocity = ((data.v_x).^2 + (data.v_y).^2).^.5;
    x_variance = var(data.x,0,2);
    y_variance = var(data.y,0,2);
    velocity_variance = var(sum_velocity,0,2);
    theta_variance = var(data.theta,0,2);
    
    time_steps = size(sum_velocity,1);
    time = linspace(0,time_steps*data.dt,time_steps);
    
    if size(time,2) < size(theta_variance,1)
        theta_variance = theta_variance(1:end-1,:);
    end
    
    
    velocity_variance_profile = figure;
    plot(time,velocity_variance);
    title('Multi-Agent Variance Profile');
    ylabel('\Delta ||^{dx}/_{dt}||');
    xlabel('Time (s)');
    
    theta_variance_profile = figure;
    plot(time,theta_variance);
    title('Multi-Agent \theta Variance Profile');
    ylabel('\Delta \theta');
    xlabel('Time (s)');
    
    x_variance_profile = figure;
    plot(time,x_variance);
    title('Multi-Agent X-Positional Variance Profile');
    ylabel('\Delta x');
    xlabel('Time (s)');
    
    y_variance_profile = figure;
    plot(time,y_variance);
    title('Multi-Agent Y-Positional Variance Profile');
    ylabel('\Delta y');
    xlabel('Time (s)');

end