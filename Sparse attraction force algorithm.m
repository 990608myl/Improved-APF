   window_count = 50 / window_size; % 计算窗口的数量
        obstacle_counts = zeros(window_count, window_count); % 创建一个全零矩阵来存储障碍物数量
for x_x = 1:window_count
    for y_y = 1:window_count
        x = (x_x-1) * window_size + 1; % 计算窗口左上角的x坐标
        y = (y_y-1) * window_size + 1; % 计算窗口左上角的y坐标

        % 计算窗口内障碍物的数量
        for j = 1:size(obstacle, 1)
            obstacle_pos = obstacle(j, :);
            if obstacle_pos(1) >= x && obstacle_pos(1) <= (x + window_size - 1) && obstacle_pos(2) >= y && obstacle_pos(2) <= (y + window_size - 1)
               obstacle_counts(x_x, y_y) = obstacle_counts(x_x, y_y) + 1;
            end
        end
    end
end
    % 找到障碍物数量最少的窗口位置
    [min_count, min_index] = min(obstacle_counts(:));
    [min_x, min_y] = ind2sub(size(obstacle_counts), min_index);
    if min_x == 1
        center_x = 12.5;
    else
        center_x = 37.5;
    end
    if min_y == 1
        center_y = 12.5;
    else
        center_y = 37.5;
    end
    for z = 1:3
        xishu = [center_x, center_y];
        distance_xishu = norm(xishu - robot_pos(z,:));
        direction_xishu = (xishu - robot_pos(z,:)) / distance_xishu;
        if center_x <= robot_pos(1,1) || center_y <= robot_pos(1,2)
            force_xishu = 0;
        else
            force_xishu = 1*distance_xishu*direction_xishu;
        end
    end
