local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("text", {
    -- Set filetype to "cmake"
    s("cmake", fmt([[
        cmake_minimum_required(VERSION 3.10)
        project({})

        # Set the C++ standard
        set(CMAKE_CXX_STANDARD 17)
        set(CMAKE_CXX_STANDARD_REQUIRED ON)
        
        # Set output directories for built binaries
        set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${{CMAKE_BINARY_DIR}}/bin)
        
        # Collect all source files automatically
        file(GLOB_RECURSE SOURCES "src/*.cpp")
        
        # Include directories (Headers)
        include_directories(include)
        
        # Create the executable
        add_executable(${{PROJECT_NAME}} ${{SOURCES}})

        # Example: Find and link external libraries
        # find_package(SFML 3 REQUIRED COMPONENTS graphics window system)
        # target_link_libraries(${{PROJECT_NAME}} PRIVATE sfml-graphics sfml-window sfml-system)

        # Example: Link additional libraries if needed
        # target_link_libraries(${{PROJECT_NAME}} PRIVATE ${{LIB_NAME}})

        # Enable warnings
        if (CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang|AppleClang")
            target_compile_options(${{PROJECT_NAME}} PRIVATE -Wall -Wextra -Wpedantic)
        elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
            target_compile_options(${{PROJECT_NAME}} PRIVATE /W4)
        endif
    ]], { i(1, "MyProject") }))  -- Default value for project name
})

