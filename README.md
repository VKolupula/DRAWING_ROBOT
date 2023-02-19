# DRAWING_ROBOT

 Build a robot that extracts line traces from an image and program it to reproduce and duplicate the images as a drawing on a whiteboard.

## Applying Concepts from Trigonometry to Control The Movements of the Robot

 decompose the movements of the robot through trigonometry to calculate the distances that allow the robot to draw on the whiteboard. combined trigonometry with equations of motion to move the robot to specific points on your whiteboard. using MATLAB scripts and the information on the motors from its respective datasheet.
 
### Key parameters of the robot

 ![1600781714-aek-ch4-sc4-2-define-distance-01](https://user-images.githubusercontent.com/120835150/219976974-c1f803c2-5d9b-4101-959f-437f8018e150.jpg)
 
![1600781717-aek-ch4-sc4-2-define-distance-02](https://user-images.githubusercontent.com/120835150/219977172-91207024-ee42-460f-9767-39f0e8a19f4d.jpg)

### Apply the Pythagorean theoram for the Distance
![1600781720-aek-ch4-sc4-2-define-distance-03](https://user-images.githubusercontent.com/120835150/219977243-a05363d3-413f-45ab-b290-6ab16278579c.jpg)

The sides of these triangles have the following relationships.
![z1z2formula](https://user-images.githubusercontent.com/120835150/219977685-e6281abd-07eb-432e-b23a-8006e32eab63.PNG)

If we solve the second equation for y^2, the first equation can be rewritten as,
![z1z2formula](https://user-images.githubusercontent.com/120835150/219977759-386c8357-ab19-4bdd-956a-a7634923b913.PNG)

Expanding this equation and solving for x, we end up with the following equations to solve for x and y sequentially.

![xyformula](https://user-images.githubusercontent.com/120835150/219977591-9dbecc8a-928d-42c5-b2c0-7be39d1def9c.PNG)

### Convert Target position to Angular Displacement

Using previous equation Z1 and Z2 computed the change in Z and the equivalent change in the string length.
![changeinz](https://user-images.githubusercontent.com/120835150/219978265-2519a5d0-0019-43cf-bf7f-4a970163eb93.PNG)

using arc-length definition to convert the change in string length to the desired angular displacement value in radians.
![theta](https://user-images.githubusercontent.com/120835150/219978399-16e5e379-e0ba-45d4-aa4d-e5b29240579f.PNG)


## Limitations of the Robot Movement

 After knowing how to program the robot movements, learned about some practical limitations of drawing using the robot and which areas are preferable to recreate the drawings.
 
## Image Processing

 process an image to extract the relevant data necessary to make the drawings on the whiteboard. By applying some image filters, obtain the line traces from the image, convert the resulting pixels to meters and then finally build segments to create the trajectory that the robot will follow.
