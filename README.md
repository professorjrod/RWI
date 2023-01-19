# RWI
Ruby WASM Interpreter

Project Goals

- Implement a parser for the WebAssembly binary format, which will allow reading and interpreting the instructions contained in a WebAssembly module. I think the best route is to convert the WASM to S-Expressions

- Implement a virtual machine or interpreter that will execute the instructions contained in the WebAssembly module. This will involve writing code to handle the different types of instructions and operands defined in the specification.

- Test the interpreter by running a variety of WebAssembly modules and comparing the results to the expected output.

- Once the interpreter is working correctly, begin adding additional features and functionality, such as support for WebAssembly's memory and threading features.


1.0 Specification: https://github.com/WebAssembly/spec
