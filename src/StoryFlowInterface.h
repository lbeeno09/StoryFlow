#ifndef STORYFLOWINTERFACE_H
#define STORYFLOWINTERFACE_H

#include <nlohmann/json.hpp>

#include <optional>
#include <string>

using json = nlohmann::json;

enum DisplayState
{
	HOME,
	OVERVIEW,
	NOVEL,
	CHARACTER,
	WORLD,
	OTHER
};

struct Overview
{

}

struct Novel
{

}

struct Character
{
    std::string name;
    std::optional<int> age;
    std::string description;

    NLOHMANN_DEFINE_TYPE_INTRUSIVE(Character, name, age, description)
}

struct World
{

}

struct Other
{

}

#endif
