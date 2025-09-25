#include <iostream>
#include <random>
#include "BannerMaker.hpp"

void ClearConsole()
{
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}

int main()
{
    while (true)
    {
        ClearConsole();
        srand(time(NULL));
        int randNum = (rand() % 10) + 1;

        std::cout << MakeBanner("Yet another guessing game");
        std::cout << MakeBanner("Pick a value from 1 to 10");

        std::string input;
        std::cout << "Your attempt ↪ ";
        std::cin >> input;
        int intGuess;
        try
        {
            intGuess = std::stoi(input);
        }
        catch (...)
        {
            std::cout << "Invalid input!\n";
        }

        if (intGuess == randNum)
            std::cout << "CORRECT!\n";
        else
            std::cout << "WRONG. It was: " << randNum << "\n";

        std::getline(std::cin, input);


        std::cout << "Press 'Enter' to proceed or 'q' to leave... ";
        std::getline(std::cin, input);

        if (input == "q" || input == "Q")
            break;
    }
}
