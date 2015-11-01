# Project Report EE16 黃翊 <span style="color:red">(101061250)</span>

# HW0 /  Pixel array manipulation

## Overview
The project is related to 
> To filp image horizontal, vertical and both of them;
> To rotate image at any angle;

## Implementation
1. image filpping
	</br>
	a. I seperate the image into three channel(R, G, B) and process them individually.  
	b. By the giving information, I create the flipping algorithm by double for loop.
	</center>
	<img src="../files/fig1.png" width="510">
	</center>
	</br>

```
 <horizontal>
 
  for h = 1 : height
       for w = 1 : width 
             R_flip(h, w) = R(h, (width -w + 1)); 
             G_flip(h, w) = G(h, (width -w + 1));
             B_flip(h, w) = B(h, (width- w + 1));
       end
  end

  <vertical>
  
  for w = 1 : width
       for h = 1 : height 
             R_flip(h, w) = R( (height - h + 1), w ); 
             G_flip(h, w) = G( (height - h + 1) , w );
             B_flip(h, w) = B( (height- h + 1) , w );
       end
  end
	
  <both>
  
  for h = 1 : height
       for w = 1 : width 
             R_flip(h, w) = R((height - h + 1),(width - w + 1)); 
             G_flip(h, w) = G((height - h + 1),(width - w + 1));
             B_flip(h, w) = B((height - h + 1),(width - w + 1));
       end
  end
		```

	 
2. image rotation
	step1. Constructing the rotation matrix and image vertex matrix and get new vertex.
	step2. find min x, min y, max x, max y.
	step3. consider how much to shift the image to the positive axis.
	step4. calculate new width and height.
	step5. initial r,g,b array for the new image.
	step6. back-warping using bilinear interpolation.
	


		### Results

		<table border=1>
		<tr>
		<td>
		<img src="../result/flip horizontal.jpg" width="24%"/>
		<img src="../result/flip vertical.jpg"  width="24%"/>
		<img src="../result/both.jpg" width="24%"/>
		<img src="../result/rotate_60.jpg" width="24%"/>
		</td>
		</tr>

		<tr>
		<td>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg"  width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		<img src="placeholder.jpg" width="24%"/>
		</td>
		</tr>

		</table>


