function [] = create_position_profile(data)

    theta = data.theta;
    avg_x = mean(data.x,2);
    avg_y = mean(data.y,2);
    avg_theta = mean(data.theta,2);
    
    
    
    time_steps = size(data.x,1);
    time = linspace(0,time_steps*data.dt,time_steps);
    
    if size(time,2) < size(avg_theta,1)
        theta = theta(1:end-1,:);
        avg_theta = avg_theta(1:end-1,:);
    end
    
    num_robots = size(data.x,2);
    ledger = create_legend(num_robots);
    
    individual_position_profile = figure;
    plot(data.x,data.y);
    title('Multi-Agent Movement Profile');
    ylabel('x');
    xlabel('y');
    legend(ledger);
    
    averaged_position_profile = figure;
    plot(avg_x,avg_y);
    title('Mean of Agents Movement Profile');
    ylabel('x');
    xlabel('y');
    
    theta_profiles = figure;
    plot(time,theta);
    title('Multi-Agent \Delta \theta Profile');
    ylabel('\theta');
    xlabel('Time (s)');
    legend(ledger);
    
    averaged_theta_profiles = figure;
    plot(time,avg_theta);
    title('Mean of Agents \Delta \theta Profile');
    ylabel('\theta');
    xlabel('Time (s)');
    
end