#include "Window.h"

#include <iostream>

void Window::Init()
{
    // Our state
    showDemoWindow = false;
    DisplayState currentState = HOME;
}

void Window::Update()
{
    ImGui::DockSpaceOverViewport(ImGui::GetMainViewport());

    // Show Menu Bar
    ShowMenuBar();

    // 1. Show the big demo window (Most of the sample code is in ImGui::ShowDemoWindow()! You can browse its code to learn more about Dear ImGui!).
    if(showDemoWindow)
    {
        ImGui::ShowDemoWindow(&showDemoWindow);
    }

    // Menu window
    {
        ImVec2 mainWindowSize = ImGui::GetMainViewport()->Size;
        ImVec2 menuWindowSize = ImVec2(mainWindowSize.x * 0.3f, -1.0f);

        ImGui::SetNextWindowSizeConstraints(menuWindowSize, menuWindowSize);
        ImGui::Begin("Menu", nullptr, ImGuiDockNodeFlags_AutoHideTabBar);

        ImVec2 buttonSize(ImGui::GetWindowWidth(), ImGui::GetWindowHeight() / 6.0f - 7.5f);

        // Home menu
        if(ImGui::Button("Home", buttonSize))
        {
            currentState = HOME;
        }

        // Overview menu
        if(ImGui::Button("Overview", buttonSize))
        {
            currentState = OVERVIEW;
        }

        // Novel menu
        if(ImGui::Button("Novel", buttonSize))
        {
            currentState = NOVEL;
        }

        // Character menu
        if(ImGui::Button("Character", buttonSize))
        {
            currentState = CHARACTER;
        }

        // World menu
        if(ImGui::Button("World", buttonSize))
        {
            currentState = WORLD;
        }

        // Misc (memos) menu
        if(ImGui::Button("Other", buttonSize))
        {
            currentState = OTHER;
        }

        ImGui::End();
    }

    // Display
    {
        ImGui::Begin("Display");

        switch(currentState)
        {
            case OVERVIEW:
                ShowOverviewDisplay();
                break;
            case NOVEL:
                ShowNovelDisplay();
                break;
            case CHARACTER:
                ShowCharacterDisplay();
                break;
            case WORLD:
                ShowWorldDisplay();
                break;
            case OTHER:
                ShowMiscDisplay();
                break;
            default: // Home
                ShowHomeDisplay();
                break;
        }

        ImGui::End();
    }

    // TODO: progamatically snap windows
}
