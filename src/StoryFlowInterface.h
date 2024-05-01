#ifndef STORYFLOWINTERFACE_H
#define STORYFLOWINTERFACE_H

#include <nlohmann/json.hpp>

#include <string>
#include <optional>
#include <vector>

using json = nlohmann::json;

struct Overview
{
    std::vector<std::string> plots;
};

struct Novel
{

};

struct Character 
{
    std::string name;
    std::optional<int> age;
    std::vector<std::string>> descriptions;
    json otherProperties;

    NLOHMANN_DEFINE_TYPE_INTRUSIVE(Character, name, age, descriptions, otherProperties)
};

struct Novel
{

};

struct Other
{

};

#endif
