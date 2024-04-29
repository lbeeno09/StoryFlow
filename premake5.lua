workspace "StoryFlow"
	configurations { "Debug", "Release" }
	
project "StoryFlow"
	kind "ConsoleApp"
	language "C++"
	targetdir "bin/%{cfg.buildcfg}"
	objdir = "bin-intermediate/%{cfg.buildcfg}"

	configurations { "Debug", "Release" }

	includedirs {
		"deps/imgui",
		"deps/imgui/backends",
		"deps/glfw/include",
		"deps/json/include"
	}

	libdirs {
		"deps/glfw/build/src/Release"
	}

	links {
		"opengl32",
		"glfw3"
	}

	files {
		"StoryFlow/**.h",
		"StoryFlow/**.cpp",
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