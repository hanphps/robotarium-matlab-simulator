function [] = perform_analysis(data)

    create_velocity_profile(data);
    create_position_profile(data);
    create_variance_profile(data);
   

end