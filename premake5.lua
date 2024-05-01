function getBuildLocation(action)
    local makes = { "gmake", "gmake2" }
    local vss = { "vs2005", "vs2008", "vs2010", "vs2012", "vs2013", "vs2015", "vs2017", "vs2019", "vs2022" }

	if makes[action] then
		return "build/make"
	elseif vss[action] then
		return "build/VS"
	elseif action == "xcode4" then
		return "build/Xcode"
	else -- codelite
		return "build/codelite"
	end
end

workspace "StoryFlow"
	configurations { "Debug", "Release" }
	
filter "action:gmake*"
	location "build/make"

filter "action:vs*"
	location "build/VS"

filter "action:xcode4"
	location "build/Xcode"

filter "action:codelite"
    location "build/codelite"

project "StoryFlow"
	kind "ConsoleApp"
	language "C++"
    cppdialect "C++20"

    local buildLocation = getBuildLocation(_ACTION)

	targetdir(buildLocation .. "/bin/%{cfg.buildcfg}")
	objdir(buildLocation .. "/bin-int/%{cfg.buildcfg}")

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
