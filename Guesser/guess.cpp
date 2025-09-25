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

        std::cout << MakeBanner("Mais um jogo de adivinhação");
        std::cout << MakeBanner("Escolha um número de 1 a 10");

        std::string input;
        std::cout << "Sua tentativa ↪ ";
        std::cin >> input;
        int intGuess;
        try
        {
            intGuess = std::stoi(input);
        }
        catch (...)
        {
            std::cout << "Entrada inválida!\n";
        }

        if (intGuess == randNum)
            std::cout << "Acertou!!!\n";
        else
            std::cout << "Errou, era: " << randNum << "\n";

        std::getline(std::cin, input);


        std::cout << "Pressione Enter para continuar ou 'q' para sair... ";
        std::getline(std::cin, input);

        if (input == "q" || input == "Q")
            break;
    }
}
