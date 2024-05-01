#ifndef _WINDOW_H
#define _WINDOW_H

#include "WindowBase.h"

#include "imgui.h"
#include "imgui_internal.h"

#include "nlohmann/json.hpp"

#include <string>

enum DisplayState
{
	HOME,
	OVERVIEW,
	NOVEL,
	CHARACTER,
	WORLD,
	OTHER
};

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

    void SaveState(const nlohmann::json& appState, const std::string& filename);
    nlohmann::json LoadState(const std::string& filename);

	// User states
	bool showDemoWindow = {};
	DisplayState currentState = {};

	char textBuffer[10000] = "";
};

#endif
