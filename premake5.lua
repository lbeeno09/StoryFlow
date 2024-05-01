workspace "StoryFlow"
	configurations { "Debug", "Release" }
	
filter "action:gmake2"
	location "build/Make"

filter "action:vs*"
	location "build/VS"

filter "action:xcode4"
	location "build/Xcode"

project "StoryFlow"
	kind "ConsoleApp"
	language "C++"
    cppdialect "C++20"

	targetdir("build/bin/%{cfg.buildcfg}")
	objdir("build/bin-int/%{cfg.buildcfg}")

	configurations { "Debug", "Release" }

	includedirs {
		"deps/imgui",
		"deps/imgui/backends",
		"deps/json/include"
	}

    
    filter "system:windows"
        includedirs {
            "deps/glfw/include"
        }

        libdirs {
            "deps/glfw/build/src"
        }

        links {
            "opengl32",
            "glfw3"
        }

    filter "system:macosx"
        includedirs {
            "/usr/local/include"
        }

        libdirs {
            "/usr/local/lib"
        }

        links {
            "Cocoa.framework",
            "OpenGL.framework",
            "IOKit.framework",
            "glfw3"
        }

	files {
		"src/**.h",
		"src/**.cpp",
		"deps/imgui/imgui.cpp",
		"deps/imgui/imgui_demo.cpp",
		"deps/imgui/imgui_draw.cpp",
		"deps/imgui/imgui_tables.cpp",
		"deps/imgui/imgui_widgets.cpp",
		"deps/imgui/backends/imgui_impl_glfw.cpp",
		"deps/imgui/backends/imgui_impl_opengl3.cpp"
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"
		architecture "x64"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "on"
		architecture "x64"
