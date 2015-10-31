% rotate image clockwised around center point (1,1), with a radius degrees 
% input1---source image: I
% input2---rotation degrees: radius (ex: pi/3)
% output---rotated image: I_rot

function I_rot = rotation(I, radius);

% RGB channel
R(:,:) = I(:,:,1);
G(:,:) = I(:,:,2);
B(:,:) = I(:,:,3);

% get height, width, channel of image
[height, width, channel] = size(I);

%% create new image
% step1. record image vertex, and use rotation matrix to get new vertex.
matrix = [cos(radius) -sin(radius) ; sin(radius) cos(radius)];
vertex = [1 width 1 width ;1 1 height height] ; % create an 2*4 matrix for rotation
vertex_new = matrix * vertex;

% step2. find min x, min y, max x, max y, use "min()" & "max()" function is ok
min_x = min(vertex_new(1,:));
max_x = max(vertex_new(1,:));
max_y = max(vertex_new(2,:)); 
min_y = min(vertex_new(2,:)); 

% step3. consider how much to shift the image to the positive axis
 x_shift = 1-min_x;  
 y_shift = 1-min_y;

% step4. calculate new width and height, if they are not integer, use
% "ceil()" & "floor()" to help get the largest width and height.

% ceil :The smallest integral value that is not less than x (as a floating-point value)
% floor:Value to round down.

 width_new = ceil(max_x) - floor(min_x);         
 height_new = ceil(max_y) - floor(min_y);

% step5. initial r,g,b array for the new image
     R_rotate = zeros(height_new, width_new,'uint8'); 
     G_rotate = zeros(height_new, width_new,'uint8');
     B_rotate = zeros(height_new, width_new,'uint8');

%% back-warping using bilinear interpolation
% for each pixel on the rotation image, find the correspond r,g,b value 
% from the source image, and save to R_rot, G_rot, B_rot.
 for y_new = 1 : height_new
     for x_new = 1 : width_new
        % step5. shift the new pixel (x_new, y_new) back, and rotate -radius
        % degree to get (x_old, y_old)
        %%% ...
        inv_matrix = [cos(-radius) -sin(-radius) ; sin(-radius) cos(-radius)];
        dx = (x_new-x_shift);
        dy = (y_new-y_shift);
        d = [dx ; dy];
        old = inv_matrix * d;
        x_old = old(1,1);  
        y_old = old(2,1);       
        % step6. using "ceil()" & "floor()" to get interpolation coordinates
        % x1, x2, y1, y2
        x1= floor(x_old);
        x2 = ceil(x_old);
        y1= floor(y_old);
        y2 = ceil(y_old);
                
        % step7. if (x_old, y_old) is inside of the source image, 
        % calculate r,g,b by interpolation.
        % else if (x_old, y_old) is outside of the source image, set
        % r,g,b = 0(black).
        if (x1 >= 1) && (x1 <= width) && (x2 >= 1) && (x2 <= width) && ...
            (y1 >= 1) && (y1 <= height)&& (y2 >= 1) && (y2 <= height)
            
            % step8. calculate weight wa, wb. Notice that if x1=x2 or y1=y2 ,
            % function "wa=()/(x1-x2)" will be fail. At this situation, you
            % need to assign a value to wa directly.
            if(x1== x2)
                wa = 1/2;
            else
                wa = (x_old-x1)/(x2-x1);
            end
            
             if(y1== y2)
                wb = 1/2;
             else
                wb = (y_old-y1)/(y2-y1);
             end
            % step9. calculate weight w1, w2 w3, w4 for 4 neighbor pixels. 
            w1=(1-wa)*(1-wb);
            w2=wa*(1-wb);
            w3=wa*wb;
            w4=(1-wa)*wb;
            % step10. calculate r,g,b with 4 neighbor point and their weight
            %%% ...
             r = R(y1,x1)*w1 + R(y2,x1)*w2 + R(y2,x2)*w3 + R(y1,x2)*w4;
             g = G(y1,x1)*w1 + G(y2,x1)*w2 + G(y2,x2)*w3 + G(y1,x2)*w4;
             b = B(y1,x1)*w1 + B(y2,x1)*w2 + B(y2,x2)*w3 + B(y1,x2)*w4;
            
        else
            r = 0;
            g = 0;
            b = 0;
        end
        R_rotate(y_new, x_new) = r;
        G_rotate(y_new, x_new) = g;
        B_rotate(y_new, x_new) = b;
    end
 end

% save R_rot, G_rot, B_rot to output image
I_rot(:,:,1) = R_rotate;
I_rot(:,:,2) = G_rotate;
I_rot(:,:,3) = B_rotate;

