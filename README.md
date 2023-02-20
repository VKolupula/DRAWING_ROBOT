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

### Requesting the initial string length measurements from the user and convert to XY measurements.
In the function "initialPosition()" the user is requested for the initial string length measurements Z1 and Z2.

![initialpositioncode](https://user-images.githubusercontent.com/120835150/220167332-600b06ca-ac3f-4dcc-9745-d14a8c46208d.PNG)

The function "countsToXY(counts,Z_i,Base)" calculates the XY position of the Drawing robot using counts,Z_i and Base values.

![counttoxycode](https://user-images.githubusercontent.com/120835150/220167667-3afdcaa2-f0f9-40a5-81bd-dd9201b2dc74.PNG)

### Convert Target position to Angular Displacement

Using previous equation Z1 and Z2 computed the change in Z and the equivalent change in the string length.

![changeinz](https://user-images.githubusercontent.com/120835150/219978265-2519a5d0-0019-43cf-bf7f-4a970163eb93.PNG)

using arc-length definition to convert the change in string length to the desired angular displacement value in radians.

![theta](https://user-images.githubusercontent.com/120835150/219978399-16e5e379-e0ba-45d4-aa4d-e5b29240579f.PNG)
The function "xyToRadians()" converts position to angle using xy,Z_i and Base measurements.

![xytoradianscode](https://user-images.githubusercontent.com/120835150/220169098-b19a9672-0080-4b77-bfb1-d3fc195496a8.PNG)
### To move the robot through a series of specified positions on the whiteboard
To move the robot through a series of specified positions on the whiteboard, the function moveToRadians() has been used.

This function makes use of the angular displacement values obtained from the previous calculations to drive the motors to the specified locations. The functions uses a Closed-Loop Control to achieve the position control.

A ‘For-Loop’ has been implemented to vectorize the function moveToRadians(), thereby allowing it to accept a vector input containing a series of target angular displacement values.

The function writeAngularPosition() automatically starts and stops the motors after achieving the target angular displacement value. The PID algorithm implemented underneath constantly tracks the input values and hence responds to any changes in the input immediately.

## Limitations of the Robot Movement

 After knowing how to program the robot movements, learned about some practical limitations of drawing using the robot and which areas are preferable to recreate the drawings.

### Identify Position Limits

If you try to move the robot to the top of the whiteboard, it won't have enough power to move above a certain point. If you try to move it too close to the pulleys, it will collide with them and get stuck. At the bottom of your whiteboard, there may be a marker tray you don't want the robot to run into.

To determine what parts of the whiteboard the robot can reach and what parts you should avoid moving the robot to.

### Understand Motor Equations and Stall Conditions
For a DC motor, a mathematical equation can be used to describe the relationship between motor load (torque), supply voltage, and rotational speed. This is sometimes referred to as the DC motor torque equation:

![DCmotortorqueequation](https://user-images.githubusercontent.com/120835150/220174909-99b03ebd-afb5-4ebb-9a28-ff3e1626dbf6.PNG)

In this equation, T is the motor torque or motor load, V is the supply voltage, and w is the angular speed (note that in some versions of this equation, the variable T is used for torque. For our project, we'll reserve T to use for tension). R refers to the resistance in the motor windings, and k is the motor constant. The values of both R and k are constant for a given motor. 

There are two special cases that we can consider for this equation. One case refers to the situation when there is no load on the motor. In this case, T = 0, and the equation simplifies to the following:

![noloadmotorcase](https://user-images.githubusercontent.com/120835150/220175700-125d9f5e-a9ab-43f7-9ca1-187b0049403f.PNG)

The second special case is when the motor reaches stall conditions. This is when the load is so high that the motor cannot spin. In this case, w = 0, and the equation simplifies to the following:

![motorstallcaseformula](https://user-images.githubusercontent.com/120835150/220175879-a979218d-9629-4aa5-bcf6-1f6ae1429867.PNG)

### Calculate Maximum Allowable Load

Considering the stall condition for the Drawing robot with the given battery and motor constants. Calculating the theoretical stall torque for given battery.

![stalltorqueforbattery](https://user-images.githubusercontent.com/120835150/220177122-a7d026c5-b363-4f0a-878a-f1e12216ee96.PNG)

It's recommended not to exceed 30% of the stall torque of the motor. Given this constraint, calculating the maximum allowable torque to apply to the motor.

![recommendedstallmaxformula](https://user-images.githubusercontent.com/120835150/220177277-c2b3af68-aaff-46e2-bd48-aaf829507866.PNG)

### Computing Torque From X-Y Position
Given an x-y position on the whiteboard, it is possible to compute the torque requirements for the motors. 

![1600781646-aek-ch4-sc4-4-free-body-diagram-01](https://user-images.githubusercontent.com/120835150/220178173-f148f4d9-c8ea-4c2c-982c-5712ef2247a7.jpg)

To compute T1, T2 from F1, F2, the resultant force pulling the robot in the direction of a pulley equals twice the amount of tension in the string over that pulley. This is because for a given pulley, the string supports the robot at two different points.

![T1T2formula](https://user-images.githubusercontent.com/120835150/220178853-66a4e3a5-3033-4178-a8be-4b8448a73227.PNG)

![1600781659-aek-ch4-sc4-4-spool-equation](https://user-images.githubusercontent.com/120835150/220179562-eadc13df-4e33-4952-8a68-29f5e7817c6e.jpg)

computing the required torque from the tension in the string. Each one of the two strings pulls the motor in a direction perpendicular to the line joining the center of the spool to the point where the string touches the motor.

The magnitude of the torque is then given as the product of the perpendicular force and the distance between the axis of rotation and the point where the force is applied. In our case, this distance refers to the radius of the spool "rspool".

![T1T2referencetoradiusofspool](https://user-images.githubusercontent.com/120835150/220179966-d810578f-ffa7-467e-bae1-9f4e96d8f08e.PNG)

![1600781650-aek-ch4-sc4-4-free-body-diagram-02](https://user-images.githubusercontent.com/120835150/220178423-e332216b-e495-415f-87bf-965d5b3ce967.jpg)

![1600781652-aek-ch4-sc4-4-free-body-diagram-03](https://user-images.githubusercontent.com/120835150/220178449-6b68d77e-b948-4615-8af9-60bdbb309f07.jpg)

![theta1theta2formula](https://user-images.githubusercontent.com/120835150/220178900-02a718f4-f51e-434d-964e-3ba4600afd46.PNG)

![1600781656-aek-ch4-sc4-4-free-body-diagram-04](https://user-images.githubusercontent.com/120835150/220178459-98ac44e0-00eb-4bbb-a333-0dcdf6d217d3.jpg)

![F1F2formula](https://user-images.githubusercontent.com/120835150/220178877-87610b31-4a8a-4d2f-9197-68210ccc7bb2.PNG)

### Compute torque at every position

Computing the torque load on each motor at every grid point. defining a single variable Tau that contains the larger of the two torque values at every position. You must never move the robot to a location where this value is greater than TauMax
 
Using the surface plot to visualize motor load Tau, at every position on the whiteboard.

![tauateverypoint](https://user-images.githubusercontent.com/120835150/220182706-ea3e6085-56c8-46c1-9e6d-1003378e17db.png)

### Eliminating Bad Regions from the Torque Map
Removeing the regions the robot should not move to, on the Torque Map. These include two types of regions. First, removeing the regions where the torque is too high. Then removeing the regions where the robot cannot go because it is too close to the pulleys or bottom of the whiteboard.

![plotallowableregion](https://user-images.githubusercontent.com/120835150/220183260-b5290d29-53b8-405e-8011-fbf8659d7935.png)

### Define and Save Drawing Limits of the Whiteboard

Defining the part of the whiteboard that the robot is allowed to draw on. which can be changed using the minimum x and y values of the drawing region. From which the  xLim and yLim are calculated and saved in the "WhiteboardLimits.mat" file.

![choosedrawableregion](https://user-images.githubusercontent.com/120835150/220183959-82e7cbbd-985c-4a30-b942-a936bfebc398.png)

## Image Processing

Process an image to extract the relevant data necessary to make the drawings on the whiteboard. By applying some image filters, obtain the line traces from the image, convert the resulting pixels to meters and then finally build segments to create the trajectory that the robot will follow.

Original Image:

![racecar](https://user-images.githubusercontent.com/120835150/220196581-eaa7c4c8-b573-4b4b-bb27-5805200ceee7.jpg)

To convert a image from pixel information to positions and pathways to draw.
the image is first read and converted RGB to grayscale using Matlab function "rgb2gray", then it is converted to a Binary image.

Grayscale Image:

![racecargrayscale](https://user-images.githubusercontent.com/120835150/220198694-369fa3c6-9f37-4080-801e-663541584739.png)


Binary images are images wherein each pixel is either on or off. These are visualized in pure black-and-white, which can be useful for describing specific regions or objects in an image. A grayscale image can be converted to a binary image with the help of the MATLAB function "imbinarize". 

Binary Image:

![racecarbinary](https://user-images.githubusercontent.com/120835150/220197689-3a76a687-c2e3-4d1b-a3b4-2013d098093f.png)

This function replaces all values above a certain threshold with 1 and those below the threshold with 0. The threshold can be global or regional.then the image is processed to reduce the thickness.

Processed Binary Image with reduced line width:

![racecarprocessed](https://user-images.githubusercontent.com/120835150/220197908-889ef1ac-e9a7-4f8f-b56e-4ce82c185cc4.png)

The "getCoords()" Function help extract traces from an image in the form of pairs of coordinate values that constitute the various lines and curves. It’s a recursive function that continues to call itself while there are still pixels available in the binarized image and then concatenates them into a single array. This function, in turn, calls the Image Processing Toolbox function bwboundaries recursively, stripping off the outer pixel boundaries from the image each time and concatenating them.

Binary Image data converted to pixel location:

![racecarpixelinorder](https://user-images.githubusercontent.com/120835150/220200285-23e71393-d934-45d5-acb6-60b5a5f4ec33.png)

The a sequence of data pairs obtained with the "getCoords" function, the different sets of pixels should be identified. This is done by checking each pair of pixels to see if they are adjacent and then splitting them off if they are not. All the resulting segments get stored in a single cell array.

The "coords2segments()" function looks at every pair of pixels and determines locations where they are not adjacent. It then splits coordsPix into sets of contiguous pixels, storing each in a separate cell as elements of the cell array segmentsPix.

coordinates list Break into contiguous segments:

![racecarinsegments](https://user-images.githubusercontent.com/120835150/220201270-cbce621c-c642-4ced-bc8a-48ab7ecc9545.png)

From the previous function, there might be segments with adjacent endpoints that could be merged with one another. This could reduce the total number of segments in the image. The function "connectSegments" does two things. First, it closes any segments that intersect themselves. Secondly, it merges any segments whose endpoints are adjacent. and also x and y pixel limits are Stored to scale the pixel values to meters.

Merged connected segments:

![racecarconnetedsegments](https://user-images.githubusercontent.com/120835150/220201887-8c03ff95-9a17-46a4-93a9-320663c40800.png)

