function getBuildLocation(action)
	if action == "gmake2" then
		return "build/make"
	elseif action == "vs2022" then
		return "build/vs2022"
	elseif action == "xcode4" then
		return "build/Xcode"
	else
		return "build/unknown"
	end
end

workspace "StoryFlow"
	configurations { "Debug", "Release" }
	
filter "action:gmake2"
	location "build/make"

filter "action:vs2022"
	location "build/vs2022"

filter "action:xcode4"
	location "build/Xcode"

project "StoryFlow"
	kind "ConsoleApp"
	language "C++"

    local buildLocation = getBuildLocation(_ACTION)

	targetdir(buildLocation .. "/bin/%{cfg.buildcfg}")
	objdir(buildLocation .. "/bin-int/%{cfg.buildcfg}")

	configurations { "Debug", "Release" }

	includedirs {
		"deps/glfw/include",
		"deps/imgui",
		"deps/imgui/backends",
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
