#include "Window.h"

void Window::ShowNovelDisplay()
{
    ImGui::Text("Novel Display");
    ImGui::InputTextMultiline("##Text", novelBuffer, sizeof(novelBuffer), ImVec2(-1, -1));
}
