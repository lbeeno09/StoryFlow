#include "StoryFlowInterface.h"

#include "Window.h"

#include <fstream>
#include <iostream>

using json = nlohmann::json

void Window::SaveState(const std::string& filename)
{
    // gather data for json
    json appState;

    appState["Overview"];
    appState["Novel"];
    appState["Character"];
    appState["World"];
    appState["Other"];


    std::ofstream file(filename);
    if(!file.is_open())
    {
        std::cerr <<"Failed to open file: " << filename << std::endl;
        return;
    }

    file << appState.dump(4);
}

json Window::LoadState(const std::string& filename)
{
    std::ifstream file(filename);
    if(!file.is_open())
    {
        std::cerr <<"Failed to open file: " << filename << std::endl;
        return {};
    }

    json appState;
    file >> appState;

    return appState;
}
