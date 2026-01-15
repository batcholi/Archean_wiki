# Visual Nodes Editor
The XenonCode IDE's node editor offers a wide range of nodes to help you create scripts and programs.

It is comprehensive enough to handle complex tasks and is also easier to grasp for beginners. For even more advanced possibilities, you can also use [XenonCode](documentation.md) in text mode (code).

---
## Code generation

The Visual Nodes system will always automatically generate code in the background as you make modifications.  
The code is generated whenever an `output`, `print`, or `execute` endpoint node is added, and it will back-propagate through input dependencies.  
This means adding an input node won't generated any code, but adding an output node will generate the code for both nodes when you connect them together.  

---
## List of nodes

Here is a list of the different types of nodes available in the editor, along with their descriptions if necessary:

`Constant Number` Defines a constant numerical value.

`Constant Text` Defines a constant textual value.

`Variable Number` Defines a variable numerical value that can be defined and reset by another node.

`Variable Text` Defines a variable textual value that can be defined and reset by another node.

`Comment` Allows you to display a comment block in your script.

---
### Input
`By Alias` Use an output node of a component using its alias when communicating through a Router.

`0,1,2,3...` Use an output node of a component that is currently connected to a port on the computer. When you connect a component to a port, it is automatically detected by the computer.

---
### Output
`Print (Console log)` Displays a number/text in the computer console.

`By Alias` Use an input node of a component using its alias when communicating through a Router.

`0,1,2,3...` Use an input node of a component that is currently connected to a port on the computer. When you connect a component to a port, it is automatically detected by the computer.

---
### Math
Math nodes can have more than two inputs, allowing you to chain multiple values in a single operation.

`Add` Returns the addition of two or more values.

`Subtract` Returns the subtraction of two or more values.

`Multiply` Returns the multiple of two or more values.

`Divide` Returns the division of two or more values.

`Absolute` Returns the absolute value of a number.

`Negative` Returns the negative value of a number.

`Modulo` Returns the remainder of the division of two numbers.

`Floor` Returns the value rounded down to the nearest integer.

`Ceil` Returns the value rounded up to the nearest integer.

`Round` Returns the value rounded to the nearest integer.

`Fract` Returns the decimal part of a number.

`Sign` Returns the sign of a number.

`Pow` Returns the power of two numbers.

`Log` Returns the logarithm of a number.

`Sqrt` Returns the square root of a number.

`Clamp` Returns the value of a number clamped between a minimum and a maximum.

`Step` Returns 0 if the value is less than a threshold and 1 if it is greater.

`Smoothstep` Returns an clamped smooth interpolation between two values based on a ratio.

`Lerp` Returns a linear interpolation between two values based on a ratio.

`Sin` Returns the sine of an angle (given in radians).

`Cos` Returns the cosine of an angle (given in radians).

`Tan` Returns the tangent of an angle (given in radians).

`Asin` Returns the arcsine angle in radians of a number.

`Acos` Returns the arccosine angle in radians of a number.

`Atan` Returns the arctangent angle in radians of a number.

---
### Boolean
Boolean values are represented as numerical values. 0 means False, anything else means True.
Boolean nodes can have more than two inputs, allowing you to chain multiple conditions in a single operation.

`And` Returns 1 if all values evaluate to True.

`Or` Returns 1 if any of the values evaluate to True.

`Xor` Returns 1 if an odd number of the values evaluate to True.

`Not` Returns the opposite of a given boolean value.

---
### Compare
`Equal` Compares if two values are equal and returns a boolean (0 or 1).

`Greater` Compares if one value is greater than another and returns a boolean (0 or 1).

`Lesser` Compares if one value is less than another and returns a boolean (0 or 1).

---
### Functions
`Expression` Allows you to write a more advanced mathematical expression using XenonCode functions and/or algebra.

`Switch` Returns different values depending on the input value.

`Counter` Returns a counter that increments with each call. The initial value, minimum, and maximum can be defined.

`Pulse` Returns 1 when its input value has changed.

`PulseToggle` Returns a boolean that toggles between True/False each time its input value has changed.

`Text` Allows you to write a more advanced textual expression.

`PID Controller` Returns a PID control value based on the error, integral of the error, and derivative of the error.

---
### Execution
`Statement` Allows you to write a pure XenonCode statement like a function call. Must output to either a Conditional or an Execute node.

`Conditional` Consider the given statement only if the given condition evaluates to True. Can be chained with other conditionals.

`Execute` Executes the connected statements in top-down order.

`Include` Includes another XenonCode script in the current script. Make sure your variables and constants nodes have unique names.

---
### Timing

`Time` Returns the current Unix Timestamp in units of seconds, having decimals with microsecond precision.

`Delay` Returns a boolean 1 after a given delay in seconds after the Set input has received a change from 1 to 0.

`Blinker` Returns an alternating boolean between 0 and 1 changing at each defined time interval in seconds.

`Smooth` Returns a value interpolating from the previous target (or 0) to the current target value with a given duration in seconds after the Start input has received a change from 1 to 0.
