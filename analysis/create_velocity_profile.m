function [] = create_velocity_profile(data)
  
    sum_velocity = ((data.v_x).^2 + (data.v_y).^2).^.5;
    avg_velocity = mean(sum_velocity,2);
    avg_theta = mean(data.theta,2);
    
    time_steps = size(avg_velocity,1);
    time = linspace(0,time_steps*data.dt,time_steps);
    
    
    num_robots = size(data.x,2);
    ledger = create_legend(num_robots);

    individual_velocity_profiles = figure;
    plot(time,sum_velocity);
    title('Multi-Agent Velocity Profile');
    ylabel('||^{dx}/_{dt}||');
    xlabel('Time (s)');
    legend(ledger);
    
    averaged_velocity_profile = figure;
    plot(time,avg_velocity);
    title('Mean of Agents Velocity Profile');
    ylabel('||^{dx}/_{dt}||');
    xlabel('Time (s)');

    
end