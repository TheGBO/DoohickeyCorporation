#include <string>

std::string MakeBannerHorizontalLine(const std::string &content)
{
    int width = (content.length() % 2 == 0) ? content.length() + 1 : content.length();

    std::string result = "+";
    for (int i = 0; i < width; i++)
    {
        result += (i == width / 2 ? '+' : (i % 2 == 0 ? '=' : '-'));
    }
    result += "+\n";
    return result;
}

std::string MakeBanner(const std::string &content)
{
    std::string result;
    result += MakeBannerHorizontalLine(content);
    result += "| " + content + " |\n";
    result += MakeBannerHorizontalLine(content);
    return result;
}