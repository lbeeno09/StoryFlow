#ifndef _WINDOW_H
#define _WINDOW_H

#include "WindowBase.h"

#include "imgui.h"

enum DisplayState
{
	HOME,
	OVERVIEW,
	NOVEL,
	CHARACTER,
	WORLD,
	OTHER
};

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

	// User states
	bool showDemoWindow = {};
	DisplayState currentState = {};

	char textBuffer[10000] = "";
};

#endif