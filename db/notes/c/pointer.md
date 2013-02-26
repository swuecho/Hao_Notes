# What Is a Pointer?

A pointer is a variable whose value is used to point to another variable.

From this definition, you know two things: first, that a pointer is a variable, so you can assign different values to a pointer variable, and second, that the value contained by a pointer must be an address that indicates the location of another variable in the memory. That's why a pointer is also called an address variable.

# Address (Left Value) Versus Content (Right Value)

As you might know, the memory inside your computer is used to hold the binary code of your program, which consists of statements and data, as well as the binary code of the operating system on your machine.

Each memory location must have a unique address so that the computer can read from or write to the memory location without any confusion. This is similar to the concept that each house in a city must have a unique address.

When a variable is declared, a piece of unused memory will be reserved for the variable, and the unique address to the memory will be associated with the name of the variable. The address associated with the variable name is usually called the left value of the variable.

Then, when the variable is assigned a value, the value is stored into the reserved memory location as the content. The content is also called the right value of the variable.

For instance, after the integer variable x is declared and assigned to a value like this:
```c
int x;
x = 7;
```
the variable x now has two values:

Left value: 1000

Right value: 7

the get the left value: 
x;

to get the right value;

&x
Here the left value, 1000, is the address of the memory location reserved for x. The right value, 7, is the content stored in the memory location. Note that depending on computers and operating systems, the right value of x can be different from one machine to another.

