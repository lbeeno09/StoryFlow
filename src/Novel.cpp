#include "Window.h"

void Window::ShowNovelDisplay()
{
    ImGui::Text("Novel Display");
    ImGui::InputTextMultiline("##Text", textBuffer, sizeof(textBuffer), ImVec2(-1, -1));
}