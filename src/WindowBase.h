#ifndef _WINDOWBASE_H
#define _WINDOWBASE_H

#define GL_SILENCE_DEPRECATION
#include <GLFW/glfw3.h>
#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"

#include <cstdio>
#include <cstdlib>

class WindowBase
{
public:
	WindowBase();

	virtual ~WindowBase();

	void Run();

	virtual void Init() = 0;
	virtual void Update() = 0;

protected:
	ImVec4 clearColor = ImVec4(0.45f, 0.55f, 0.60f, 1.00f);

private:
	GLFWwindow* window = {};
};

#endif