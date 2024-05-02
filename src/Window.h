#ifndef _WINDOW_H
#define _WINDOW_H

#include "StoryflowInterface.h"
#include "WindowBase.h"

#include "imgui.h"
#include "imgui_internal.h"

#include "nlohmann/json.hpp"

#include <string>

// TODO: Define structs for each menu

class Window : public WindowBase
{
public:
	Window() = default;
	~Window() = default;

	virtual void Init() final;
	virtual void Update() final;

private:
	void ShowMenuBar();
	void ShowHomeDisplay();
	void ShowOverviewDisplay();
	void ShowNovelDisplay();
	void ShowCharacterDisplay();
	void ShowWorldDisplay();
	void ShowMiscDisplay();

    // Saving/State management
    void SaveState(const nlohmann::json& appState, const std::string& filename);
    nlohmann::json LoadState(const std::string& filename);
	char overviewBuffer[10000] = "";
	char novelBuffer[10000] = "";
	char Buffer[10000] = "";
	char novelBuffer[10000] = "";

	char novelBuffer[10000] = "";

	// User states
	bool showDemoWindow = {};
	DisplayState currentState = {};

};

#endif
