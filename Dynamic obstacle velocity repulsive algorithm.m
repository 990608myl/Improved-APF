%障碍物速度势场
%         obstacle_force_v = zeros(2,1);

        for j = 1:size(obstacle, 1)
            obstacle_pos_v = obstacle(j, :);
            distance_rep_v = norm(robot_pos(i,:)' - obstacle_pos_v');
%             if distance_rep <= range  % 判断是否在一定范围内
                direction_rep_v = (robot_pos(i, :)' - obstacle_pos') / distance_rep_v;
                
                v_diff = norm(obstacle_speed(j, :) - velocity');
                angle_diff = acos(dot(velocity', obstacle_speed(j, :)) / (norm(velocity) * norm(obstacle_speed(j, :))));
                     if  angle_diff <= pi/2 && distance_rep_v < range
                        obstacle_force_v =obstacle_force_v+ ((distance_rep_v * (n / v_diff)) * direction_rep_v);
                        
                     else
                         obstacle_force_v = zeros(2,1);
                     end
%             end
        end
%         a=sum(obstacle_force')';
%         non_zero_elements = a(a ~= 0);
